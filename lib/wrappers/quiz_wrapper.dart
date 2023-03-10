// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/screen/player_screen.dart';
import 'package:quizkidz/screen/quizmaster_screen.dart';

class QuizWrapper extends ConsumerWidget {
  final String quizid;

  const QuizWrapper({
    super.key,
    required this.quizid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizByIdProvider(quizid));
    final activeAppUser = ref.watch(activeAppUserProvider);

    return quiz.when(
        data: (quizData) => activeAppUser.when(
            data: (userData) => (quizData?.quizmaster.uid == userData?.uid)
                ? QuizmasterScreen(
                    quizId: quizData!.id,
                  )
                : PlayerScreen(
                    quizId: quizData!.id,
                  ),
            error: (error, __) => Text(error.toString()),
            loading: () => const LoadingSpinner()),
        error: (error, __) => Text(error.toString()),
        loading: () => const LoadingSpinner());
  }
}
