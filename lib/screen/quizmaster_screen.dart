// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/question_display.dart';

// Project imports:
import 'package:quizkidz/components/quiz_app_bar.dart';
import 'package:quizkidz/components/quiz_leaderboard.dart';
import 'package:quizkidz/util/util.dart';

class QuizmasterScreen extends ConsumerWidget {
  final String quizId;

  const QuizmasterScreen({
    Key? key,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: QuizAppBar(
        quizId: quizId,
        entries: [
          PopupMenuItem<int>(
            value: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Leave',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                  ),
                ),
                Icon(
                  Icons.emoji_people,
                  color: Colors.black54,
                  size: 22,
                ),
              ],
            ),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'End',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                  ),
                ),
                Icon(
                  Icons.checklist_rtl_sharp,
                  color: Colors.black54,
                  size: 22,
                ),
              ],
            ),
          ),
        ],
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
            flex: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuestionDisplay(
                  quizId: quizId,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
