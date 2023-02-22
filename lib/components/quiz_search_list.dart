// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/providers/auth_provider.dart';
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
    final quizService = ref.watch(quizServiceProvider);
    final authService = ref.watch(authServicesProvider);

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
          itemBuilder: ((context, index) =>
              authService.currentUserId == filteredQuizzes[index].quizmaster.uid
                  ? Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) => quizService
                          .deleteQuiz(quizId: filteredQuizzes[index].id)
                          .then(
                            (value) => value.match(
                              (error) => print(error.toString()),
                              (r) => ScaffoldMessenger.of(context).showSnackBar(
                                CustomSnackAlert.showSuccessSnackBar(
                                  message: 'Quiz Deleted.',
                                ),
                              ),
                            ),
                          ),
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        color: Colors.redAccent,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: QuizListItem(
                        quiz: filteredQuizzes[index],
                      ),
                    )
                  : QuizListItem(
                      quiz: filteredQuizzes[index],
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

class QuizListItem extends ConsumerWidget {
  final Quiz quiz;

  const QuizListItem({super.key, required this.quiz});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormatter = ref.watch(dateFormatServiceProvider);
    final quizService = ref.watch(quizServiceProvider);

    return Padding(
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
              quiz.quizmaster.appAvatarColor,
            ),
            backgroundImage: AssetImage(
              quiz.quizmaster.appAvatar,
            ),
          ),
          title: Text(
            quiz.quizmaster.appDisplayName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          subtitle: Text(
            dateFormatter.formatDate(
              quiz.created,
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
                    quizId: quiz.id,
                  )
                  .then(
                    (value) => value.match(
                      (error) => print(error.toString()),
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizWrapper(
                            quizid: quiz.id,
                          ),
                        ),
                      ),
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
