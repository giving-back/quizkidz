// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class FollowingList extends ConsumerWidget {
  const FollowingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final following = ref.watch(followingProvider);
    final activeUsers = ref.watch(activeAppUsersProvider);
    final authService = ref.watch(authServicesProvider);

    return following.when(
      data: (followingListData) {
        return activeUsers.when(
          data: (active) {
            final List<String> followingIds = followingListData
                .map((following) => following.following)
                .toList();

            List<AppUser> activeCopy = [];
            activeCopy.addAll(active);

            activeCopy.retainWhere((user) {
              return followingIds.contains(user.uid);
            });

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: followingListData.length, // active.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: GridTile(
                        footer: Container(
                          color: const Color(kBlueColor),
                          child: Center(
                            child: TextButton(
                              child: const Text(
                                'Unfollow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => authService
                                  .unfollowUser(activeCopy[index].uid)
                                  .then(
                                    (value) => value.match(
                                        (error) => print(error.toString()),
                                        (r) => null),
                                  ),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(
                                  activeCopy[index].appAvatarColor,
                                ),
                                backgroundImage: AssetImage(
                                  activeCopy[index].appAvatar,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                activeCopy[index].appDisplayName,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Won',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        '${activeCopy[index].quizWins}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Correct',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        '${activeCopy[index].questionsAnswered}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => const Text('error'),
          loading: () => const LoadingSpinner(),
        );
      },
      error: (error, stackTrace) => const Text('error'),
      loading: () => const LoadingSpinner(),
    );
  }
}
