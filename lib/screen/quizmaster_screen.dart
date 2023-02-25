// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/question_display.dart';
import 'package:quizkidz/components/quiz_answer_leaderboard.dart';
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
      backgroundColor: Colors.white,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              child: Column(
                children: [
                  QuestionDisplay(
                    quizId: quizId,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  QuizAnswerLeaderboard(
                    quizId: quizId,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: QuizLeaderboard(quizId: quizId),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
