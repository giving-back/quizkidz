// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/number_box.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/providers/state_provider.dart';

class QuestionDisplay extends ConsumerWidget {
  final String quizId;

  const QuestionDisplay({
    super.key,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionNumber = ref.watch(questionNumberProvider);
    final questions = ref.watch(quizQuestionsProvider);
    final quizService = ref.watch(quizServiceProvider);
    final quiz = ref.watch(quizByIdProvider(quizId));

    return questions.when(
      data: (questionsList) => quiz.when(
          data: (quizData) => questionNumber < quizData!.questions.length
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          NumberBox(
                            text: (questionNumber + 1).toString(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              questionsList[quizData.questions[questionNumber]]
                                  .q,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              questionsList[quizData.questions[questionNumber]]
                                  .a,
                              style: TextStyle(
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () async => await quizService
                                  .endQuestion(
                                    quizId: quizId,
                                  )
                                  .then(
                                    (value) => value.match(
                                        (error) => print(error.toString()),
                                        (r) => null),
                                  ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'skip',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: const [
                          Flexible(
                            child: Text(
                              'No more questions',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          error: (error, stacktrace) => Text(error.toString()),
          loading: () => const LoadingSpinner()),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const LoadingSpinner(),
    );
  }
}
