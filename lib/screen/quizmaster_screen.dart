// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/common_app_bar.dart';
import 'package:quizkidz/components/quiz_leaderboard.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';

class QuizmasterScreen extends ConsumerWidget {
  final String quizId;

  const QuizmasterScreen({
    Key? key,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizService = ref.watch(quizServiceProvider);

    return WillPopScope(
      onWillPop: () async {
        var pop = false;

        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              title: const Text(
                "Just Checking..",
                style: TextStyle(
                  color: Color(kAvatarOrange),
                  fontSize: 15,
                ),
              ),
              content: const Text(
                "You are leaving a quiz you are running. ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
              actions: [
                TextButton(
                  style: const ButtonStyle(
                    textStyle: MaterialStatePropertyAll<TextStyle?>(
                      TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  child: const Text("Leave Quiz"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    pop = true;
                  },
                ),
                TextButton(
                  style: const ButtonStyle(
                    textStyle: MaterialStatePropertyAll<TextStyle?>(
                      TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  child: const Text("End Quiz"),
                  onPressed: () {
                    quizService.endQuiz(quizId: quizId).then(
                          (value) => value.match(
                            (error) => print(error.toString()),
                            (result) {
                              Navigator.of(context).pop();
                              pop = true;
                            },
                          ),
                        );
                  },
                ),
              ],
            );
          },
        );

        return pop;
      },
      child: Scaffold(
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
              flex: 60,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
