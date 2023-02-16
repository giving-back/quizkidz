// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final following = ref.watch(followingProvider);
    final followers = ref.watch(followersProvider);

    return Column(
      children: [
        Expanded(
          flex: 20,
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
                          children: [
                            const Text(
                              "My Friends",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showSearch(
                                  context: context,
                                  delegate: FriendSearchDelegate(),
                                );
                              },
                              icon: const Icon(
                                LineIcons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Following',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            following.when(
                              data: (following) => Text(
                                '${following.length}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              error: (error, stackTrace) =>
                                  Text(error.toString()),
                              loading: () => const LoadingSpinner(),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Followers',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            followers.when(
                              data: (followers) => Text(
                                '${followers.length}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              error: (error, stackTrace) =>
                                  Text(error.toString()),
                              loading: () => const LoadingSpinner(),
                            )
                          ],
                        ),
                      ],
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
          flex: 80,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Following",
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
