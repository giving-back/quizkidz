// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';

// Project imports:
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';

class Buzzer extends ConsumerWidget {
  final String quizId;

  const Buzzer({
    Key? key,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizService = ref.watch(quizServiceProvider);
    final myQuizAnswer = ref.watch(myQuizAnswerProvider(quizId));

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: myQuizAnswer.when(
          data: (quizAnswer) {
            return ElevatedButton(
              onPressed: quizAnswer != null
                  ? null
                  : () async => await quizService
                      .buzz(quizId: quizId)
                      .then((value) => value.match(
                          (error) => print(
                                error.toString(),
                              ),
                          (result) => null)),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(60)),
                backgroundColor:
                    MaterialStateProperty.all(const Color(kBlueColor)),
              ),
              child: const Text(
                'Buzz!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          error: (error, stacktrace) => Text(
            error.toString(),
          ),
          loading: () => const LoadingSpinner(),
        ));
  }
}
