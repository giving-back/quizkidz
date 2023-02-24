// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/number_box.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';

class QuizLeaderboard extends ConsumerWidget {
  final String quizId;

  const QuizLeaderboard({super.key, required this.quizId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizPlayers = ref.watch(quizPlayersProvider(quizId));

    Widget leaderboardIcon(int index) {
      if (index == 0) {
        return const Icon(
          Icons.workspace_premium,
          size: 30,
          color: Color(kGoldColor),
        );
      }
      if (index == 1) {
        return const Icon(
          Icons.workspace_premium,
          size: 30,
          color: Color(kSilverColor),
        );
      }
      if (index == 2) {
        return const Icon(
          Icons.workspace_premium,
          size: 30,
          color: Color(kBronzeColor),
        );
      }
      return NumberBox(
        text: (index + 1).toString(),
      );
    }

    return quizPlayers.when(
        data: (quizPlayersList) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                itemCount: quizPlayersList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Color(quizPlayersList[index].player.appAvatarColor),
                      backgroundImage: AssetImage(
                        quizPlayersList[index].player.appAvatar,
                      ),
                    ),
                    title: Text(
                      quizPlayersList[index].player.appDisplayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    subtitle: Text(
                      '${quizPlayersList[index].score} points',
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    trailing: leaderboardIcon(index),
                  );
                },
              ),
            ),
        error: (error, stacktrace) {
          print(error.toString());
          return Text(
            error.toString(),
          );
        },
        loading: () => const LoadingSpinner());
  }
}
