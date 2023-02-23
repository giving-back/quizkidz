// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/buzzer.dart';
import 'package:quizkidz/components/common_app_bar.dart';
import 'package:quizkidz/components/quiz_leaderboard.dart';
import 'package:quizkidz/util/util.dart';

class PlayerScreen extends ConsumerWidget {
  final String quizId;

  const PlayerScreen({super.key, required this.quizId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(
        showAlert: false,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 40,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(
                  kBlueColor,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
              ),
              child: QuizLeaderboard(quizId: quizId),
            ),
          ),
          Expanded(
            flex: 50,
            child: Center(
              child: Buzzer(
                quizId: quizId,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
