// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/buzzer.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/quiz_app_bar.dart';
import 'package:quizkidz/components/quiz_leaderboard.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';

class PlayerScreen extends ConsumerWidget {
  final String quizId;

  const PlayerScreen({super.key, required this.quizId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizByIdProvider(quizId));
    final authService = ref.watch(authServicesProvider);

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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40,
                  bottom: 60,
                ),
                child: QuizLeaderboard(quizId: quizId),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Center(
              child: quiz.when(
                data: (quizData) => quizData!.active
                    ? Buzzer(
                        quizId: quizId,
                      )
                    : ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(
                            quizData.winner.player.appAvatarColor,
                          ),
                          backgroundImage: AssetImage(
                            quizData.winner.player.appAvatar,
                          ),
                        ),
                        title: authService.currentUserId ==
                                quizData.winner.player.uid
                            ? const Text(
                                'Congrats you won!',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                ),
                              )
                            : Text(
                                '${quizData.winner.player.appDisplayName} is the winner',
                                style: const TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                ),
                              ),
                      ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const LoadingSpinner(),
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
