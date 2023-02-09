// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/screen/home_screen.dart';
import 'package:quizkidz/wrappers/auth_wrapper.dart';

class QuizWrapper extends ConsumerWidget {
  final String quizid;

  const QuizWrapper({
    super.key,
    required this.quizid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizByIdProvider(quizid));

    return quiz.when(
      data: (data) {
        return Text(
          data.toString(),
        );
      },
      error: (error, stackTrace) => Text(
        stackTrace.toString(),
      ),
      loading: () => const LoadingSpinner(),
    );
  }
}
