// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/providers/auth_provider.dart';

class SearchList extends ConsumerWidget {
  final String query;

  const SearchList({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAppUsers = ref.watch(activeUsersProvider);
    final authService = ref.watch(authServicesProvider);

    return activeAppUsers.when(
      data: (data) {
        final List<AppUser> filteredMembers = data
            .where(
              (member) => member.appDisplayName.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
        return ListView.builder(
          itemCount: filteredMembers.length,
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                ),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(
                        filteredMembers[index].appAvatarColor,
                      ),
                      backgroundImage: AssetImage(
                        filteredMembers[index].appAvatar,
                      ),
                    ),
                    title: Text(
                      filteredMembers[index].appDisplayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    subtitle: Text(filteredMembers[index].email!),
                    trailing: FollowingCheckIcon(
                      uid: filteredMembers[index].uid,
                    ),
                  ),
                ),
              )),
        );
      },
      error: (error, stackTrace) => const Text('error'),
      loading: () => const LoadingSpinner(),
    );
  }
}

class FollowingCheckIcon extends ConsumerWidget {
  final String uid;

  const FollowingCheckIcon({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final following = ref.watch(followingProvider);
    final authService = ref.watch(authServicesProvider);

    return following.when(
        data: (data) {
          var contain = data.where((element) => element.uid == uid);

          if (contain.isEmpty) {
            return IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                authService.followUser(uid).then(
                      (value) => value.match(
                        (error) => print(error.toString()),
                        (r) => null,
                      ),
                    );
              },
            );
          } else {
            return const Text(
              'Following',
              style: TextStyle(
                color: Colors.black54,
              ),
            );
          }
        },
        error: (error, stackTrace) => const Text('error'),
        loading: () => const LoadingSpinner());
  }
}
