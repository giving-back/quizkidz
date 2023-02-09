// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/num_questions_list.dart';
import 'package:quizkidz/components/quiz_button.dart';
import 'package:quizkidz/components/subjects_list.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/providers/state_provider.dart';
import 'package:quizkidz/wrappers/quiz_wrapper.dart';

class NewQuizOptions extends ConsumerWidget {
  const NewQuizOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionType = ref.watch(questionTypeProvider);
    final numQuestions = ref.watch(numQuestionProvider);
    final quizService = ref.watch(quizServiceProvider);
    final currentUser = ref.watch(authStateProvider);

    return Padding(
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
            const Expanded(
              flex: 20,
              child: SubjectsList(),
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
            const Expanded(
              flex: 10,
              child: NumQuestionsList(),
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
                onPressed: () async {
                  currentUser.when(
                    data: (data) {
                      quizService
                          .startNewQuiz(
                            Quiz(
                              quizmaster: QuizUser(
                                uid: data!.uid,
                                appDisplayName: data.appDisplayName,
                                appAvatar: data.appAvatar,
                                appAvatarColor: data.appAvatarColor,
                              ),
                              subject: questionType,
                              questions: numQuestions,
                              created: DateTime.now(),
                            ),
                          )
                          .then(
                            (value) => value.match(
                              (error) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    CustomSnackAlert.showErrorSnackBar(),
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
                          );
                    },
                    error: (_, __) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          CustomSnackAlert.showErrorSnackBar(),
                        );
                    },
                    loading: () => const LoadingSpinner(),
                  );
                },
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
