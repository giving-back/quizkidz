// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/new_quiz_options.dart';
import 'package:quizkidz/components/quiz_button.dart';
import 'package:quizkidz/components/text_divider.dart';
import 'package:quizkidz/components/user_score_summary.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAppUser = ref.watch(activeAppUserProvider);

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
                    padding: const EdgeInsets.all(45.0),
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
                  onPressed: () {},
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
                  onPressed: () => showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    context: context,
                    builder: (_) => const NewQuizOptions(),
                  ),
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
