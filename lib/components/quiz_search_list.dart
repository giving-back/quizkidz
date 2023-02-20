// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/providers/date_format_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';
import 'package:quizkidz/wrappers/quiz_wrapper.dart';

class QuizSearchList extends ConsumerWidget {
  final String query;

  const QuizSearchList({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeQuizzes = ref.watch(activeQuizzesProvider);
    final dateFormatter = ref.watch(dateFormatServiceProvider);
    final quizService = ref.watch(quizServiceProvider);

    return activeQuizzes.when(
      data: (activeQuizzesList) {
        final List<Quiz> filteredQuizzes = activeQuizzesList
            .where(
              (activeQuiz) =>
                  activeQuiz.quizmaster.appDisplayName.toLowerCase().contains(
                        query.toLowerCase(),
                      ),
            )
            .toList();

        return ListView.builder(
          itemCount: filteredQuizzes.length,
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                ),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(
                        filteredQuizzes[index].quizmaster.appAvatarColor,
                      ),
                      backgroundImage: AssetImage(
                        filteredQuizzes[index].quizmaster.appAvatar,
                      ),
                    ),
                    title: Text(
                      filteredQuizzes[index].quizmaster.appDisplayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    subtitle: Text(
                      dateFormatter.formatDate(
                        filteredQuizzes[index].created,
                      ),
                    ),
                    trailing: TextButton(
                      child: const Text(
                        'Join',
                        style: TextStyle(
                          color: Color(kBlueColor),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        quizService
                            .markQuizAlertAsRead(
                              quizId: filteredQuizzes[index].id,
                            )
                            .then(
                              (value) => value.match(
                                (error) => print(error.toString()),
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizWrapper(
                                      quizid: filteredQuizzes[index].id,
                                    ),
                                  ),
                                ),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              )),
        );
      },
      error: (error, stackTrace) {
        print(error.toString());
        return Text(error.toString());
      },
      loading: () => const LoadingSpinner(),
    );
  }
}
