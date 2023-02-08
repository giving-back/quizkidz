// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/quiz_button.dart';
import 'package:quizkidz/components/text_divider.dart';
import 'package:quizkidz/components/user_score_summary.dart';
import 'package:quizkidz/models/quiz_type.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class HomeScreen extends ConsumerWidget {
  final String uid;

  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(appUserByIdProvider(uid));

    return appUser.when(
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
                                  'lib/images/quiz/winners_trophy.jpg',
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
                                  'lib/images/quiz/winners_medal.png',
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
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      context: context,
                      builder: (_) => Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SizedBox(
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Choose a Subject.',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 20,
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => SizedBox(
                                    height: 110,
                                    width: 110,
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                kQuizTypeImages[index].image),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                          ),
                                          Text(
                                            kQuizTypeImages[index].text,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  ),
                                  itemCount: kQuizTypeImages.length,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 10,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 12,
                                    right: 12,
                                    bottom: 12,
                                  ),
                                  child: Row(
                                    children: const [
                                      Text(
                                        'How many Questions?',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      color: const Color(kBlueColor),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            numQuestions[index].toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  ),
                                  itemCount: numQuestions.length,
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 15,
                                child: QuizButton(
                                  text: 'Start!',
                                  edgeInsets: const EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
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
