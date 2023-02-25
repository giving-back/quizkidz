// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';

// Project imports:
import 'package:quizkidz/components/question_display.dart';
import 'package:quizkidz/components/quiz_answer_leaderboard.dart';
import 'package:quizkidz/components/quiz_app_bar.dart';
import 'package:quizkidz/components/quiz_leaderboard.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';

class QuizmasterScreen extends ConsumerWidget {
  final String quizId;

  const QuizmasterScreen({
    Key? key,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizService = ref.watch(quizServiceProvider);
    final quiz = ref.watch(quizByIdProvider(quizId));

    return quiz.when(
        data: (quizData) => Scaffold(
              floatingActionButton: Visibility(
                visible: quizData!.active,
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(kBlueColor),
                  label: const Text(
                    'End Quiz',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(Icons.assignment_rounded),
                  onPressed: () => quizService.endQuiz(quizId: quizId).then(
                        (value) => value.match(
                            (error) => print(
                                  error.toString(),
                                ),
                            (result) => null),
                      ),
                ),
              ),
              backgroundColor: Colors.white,
              appBar: QuizAppBar(
                quizId: quizId,
                entries: [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Leave',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                          ),
                        ),
                        Icon(
                          Icons.emoji_people,
                          color: Colors.black54,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 40,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(
                          kBlueColor,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                        ),
                      ),
                      child: quizData.active
                          ? Column(
                              children: [
                                QuestionDisplay(
                                  quizId: quizId,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                ),
                                QuizAnswerLeaderboard(
                                  quizId: quizId,
                                ),
                              ],
                            )
                          : quizData.winner.score > 0
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 50,
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Color(
                                        quizData.winner.player.appAvatarColor,
                                      ),
                                      backgroundImage: AssetImage(
                                        quizData.winner.player.appAvatar,
                                      ),
                                    ),
                                    title: Text(
                                      '${quizData.winner.player.appDisplayName} is the winner',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                )
                              : const ListTile(
                                  title: Text(
                                    'No winners in this quiz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: QuizLeaderboard(quizId: quizId),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(),
                  ),
                ],
              ),
            ),
        error: (error, stacktrace) => Text(error.toString()),
        loading: () => const LoadingSpinner());
  }
}
