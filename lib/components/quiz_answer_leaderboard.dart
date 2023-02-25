// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/quiz_provider.dart';

class QuizAnswerLeaderboard extends ConsumerWidget {
  final String quizId;

  const QuizAnswerLeaderboard({super.key, required this.quizId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizAnswers = ref.watch(quizAnswersProvider(quizId));
    final quizService = ref.watch(quizServiceProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        quizAnswers.when(
          data: (quizAnswersList) {
            return quizAnswersList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 70,
                      right: 70,
                    ),
                    child: ListTile(
                      leading: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () => quizService
                              .deleteQuizAnswer(
                                quizId: quizId,
                                answerId: quizAnswersList[0].player.uid,
                              )
                              .then(
                                (value) => value.match(
                                    (error) => print(error.toString()),
                                    (result) => null),
                              ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.thumb_down,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Color(quizAnswersList[0].player.appAvatarColor),
                            backgroundImage: AssetImage(
                              quizAnswersList[0].player.appAvatar,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                          ),
                          Text(
                            quizAnswersList[0].player.appDisplayName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      trailing: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () => quizService
                              .correctAnswer(
                                quizId: quizId,
                                playerId: quizAnswersList[0].player.uid,
                              )
                              .then(
                                (value) => value.match(
                                    (error) => print(error.toString()),
                                    (result) => null),
                              ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container();
          },
          error: (error, stacktrace) {
            print(error.toString());
            return Text(
              error.toString(),
            );
          },
          loading: () => const LoadingSpinner(),
        ),
      ],
    );
  }
}
