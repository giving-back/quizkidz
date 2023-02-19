// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

// Project imports:
import 'package:quizkidz/components/following_list.dart';
import 'package:quizkidz/components/connection_search_delegate.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class ConnectionsScreen extends ConsumerWidget {
  const ConnectionsScreen({Key? key}) : super(key: key);

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
            data: (activeAppUserData) => Container(
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
                        activeAppUserData!.appAvatarColor,
                      ),
                      backgroundImage: AssetImage(
                        activeAppUserData.appAvatar,
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
                                  delegate: ConnectionSearchDelegate(),
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
                              data: (followingData) => Text(
                                '${followingData.length}',
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
                              data: (followersData) => Text(
                                '${followersData.length}',
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
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 20.0,
                  bottom: 8.0,
                ),
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
              const FollowingList(),
            ],
          ),
        ),
      ],
    );
  }
}
