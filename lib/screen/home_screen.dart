// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/quiz_button.dart';
import 'package:quizkidz/components/quiz_search_delegate.dart';
import 'package:quizkidz/components/text_divider.dart';
import 'package:quizkidz/components/user_score_summary.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';
import 'package:quizkidz/wrappers/quiz_wrapper.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAppUser = ref.watch(activeAppUserProvider);
    final quizService = ref.watch(quizServiceProvider);
    final currentUser = ref.watch(authStateProvider);
    final followers = ref.watch(followersProvider);

    return activeAppUser.when(
      data: (data) => Column(
        children: [
          Expanded(
            flex: 35,
            child: Container(
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
                            Text(
                              'Hi ${data.appDisplayName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: const Text(
                      "Let's Play!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 45.0,
                      right: 45,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 20,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: UserScoreSummary(
                                image: const AssetImage(
                                  kWinnersTrophyImage,
                                ),
                                text: 'Won',
                                data: data.quizWins.toString(),
                              ),
                            ),
                            const VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 2,
                            ),
                            Expanded(
                              child: UserScoreSummary(
                                image: const AssetImage(
                                  kWinnersMedalImage,
                                ),
                                text: 'Answers',
                                data: data.questionsAnswered.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QuizButton(
                  text: 'Join a Quiz',
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: QuizSearchDelegate(),
                    );
                  },
                  edgeInsets: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                    top: 30,
                    bottom: 30,
                  ),
                ),
                const TextDivider(
                  text: 'Or',
                ),
                QuizButton(
                  text: 'Start a Quiz',
                  onPressed: () async {
                    currentUser.when(
                      data: (user) {
                        followers.when(
                            data: (followers) => quizService
                                .startNewQuiz(
                                  quiz: Quiz(
                                    quizmaster: QuizUser(
                                      uid: user!.uid,
                                      appDisplayName: user.appDisplayName,
                                      appAvatar: user.appAvatar,
                                      appAvatarColor: user.appAvatarColor,
                                    ),
                                    created: DateTime.now(),
                                  ),
                                  followers: followers,
                                )
                                .then(
                                  (value) => value.match(
                                    (error) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          CustomSnackAlert.showErrorSnackBar(
                                            message: kUserError,
                                          ),
                                        );
                                    },
                                    (result) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuizWrapper(
                                            quizid: result,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            error: (_, __) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  CustomSnackAlert.showErrorSnackBar(
                                    message: kUserError,
                                  ),
                                );
                            },
                            loading: () => const LoadingSpinner());
                      },
                      error: (_, __) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            CustomSnackAlert.showErrorSnackBar(
                              message: kUserError,
                            ),
                          );
                      },
                      loading: () => const LoadingSpinner(),
                    );
                  },
                  edgeInsets: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                    top: 30,
                    bottom: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const LoadingSpinner(),
    );
  }
}
