import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/avatar_list_view%20copy.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/providers/state_provider.dart';
import 'package:quizkidz/util/util.dart';

class QuestionDisplay extends ConsumerWidget {
  final String quizId;

  const QuestionDisplay({
    super.key,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionIndex = ref.watch(questionIndexProvider);
    final questions = ref.watch(quizQuestionsProvider);
    final quizService = ref.watch(quizServiceProvider);

    return questions.when(
      data: (questionsList) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: questionIndex < questionsList.length
                  ? ListTile(
                      leading: NumberBox(
                        text: (questionIndex + 1).toString(),
                      ),
                      title: Text(
                        questionsList[questionIndex].q,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          questionsList[questionIndex].a,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      trailing: InkWell(
                        onTap: () async => await quizService
                            .endQuestion(
                              quizId: quizId,
                            )
                            .then(
                              (value) => value.match(
                                  (error) => print(error.toString()),
                                  (r) => null),
                            ),
                        child: const Text(
                          'skip',
                          style: TextStyle(
                            color: Color(kBlueColor),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : const ListTile(
                      title: Text(
                        'No more questions.',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const LoadingSpinner(),
    );
  }
}
