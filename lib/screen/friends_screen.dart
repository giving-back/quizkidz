// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:line_icons/line_icons.dart';

// Project imports:
import 'package:quizkidz/components/friend_search_delegate.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class FriendsScreen extends ConsumerWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAppUser = ref.watch(activeAppUserProvider);
    final activeAppUsers = ref.watch(activeUsersProvider);
    final myFriends = ref.watch(myFriendsProvider);

    return Column(
      children: [
        Expanded(
          flex: 15,
          child: activeAppUser.when(
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
                              "My Friends",
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
                    subtitle: myFriends.when(
                      data: (data) {
                        final matched = data
                            .where((friend) => friend.matched)
                            .toList()
                            .length;

                        final pending = data
                            .where((friend) => !friend.matched)
                            .toList()
                            .length;

                        return Row(
                          children: [
                            Text(
                              '$matched matched. ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '$pending pending.',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                      error: (error, stackTrace) => Text(
                        error.toString(),
                      ),
                      loading: () => const LoadingSpinner(),
                    ),
                  ),
                ],
              ),
            ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const LoadingSpinner(),
          ),
        ),
        Expanded(
          flex: 85,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Friends",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                    activeAppUsers.when(
                      data: (data) => IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: FriendSearchDelegate(
                              authService: ref.watch(authServicesProvider),
                              items: data,
                            ),
                          );
                        },
                        icon: const Icon(
                          LineIcons.search,
                          color: Colors.black54,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Text(
                      "Pending",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Text(
                      "Invitations",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
