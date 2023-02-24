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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        quizAnswers.when(
          data: (quizAnswersList) {
            return quizAnswersList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 90,
                      right: 90,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.thumb_down,
                        color: Colors.white,
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
                      trailing: const Icon(
                        Icons.thumb_up,
                        color: Colors.white,
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
