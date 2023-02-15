// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:quizkidz/components/friend_search_delegate.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class FriendsScreen extends ConsumerWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAppUser = ref.watch(activeAppUserProvider);
    final activeAppUsers = ref.watch(activeUsersProvider);

    return activeAppUser.when(
      data: (data) => Container(
        decoration: const BoxDecoration(
          color: Color(
            kBlueColor,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Color(
                  data!.appAvatarColor,
                ),
                backgroundImage: AssetImage(
                  data.appAvatar,
                ),
              ),
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Friends",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              subtitle: Text(
                'Hi ${data.appDisplayName}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            activeAppUsers.when(
              data: (data) => IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: FriendSearchDelegate(
                      items: data,
                    ),
                  );
                },
                icon: const Icon(
                  LineIcons.search,
                  color: Colors.white,
                ),
              ),
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const LoadingSpinner(),
            )
          ],
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const LoadingSpinner(),
    );
  }
}
