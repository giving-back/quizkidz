// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/common_app_bar.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';

class PlayerScreen extends ConsumerWidget {
  final String quizId;

  const PlayerScreen({super.key, required this.quizId});

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
      return Text(index.toString());
    }

    return Scaffold(
      appBar: const CommonAppBar(
        showAlert: false,
      ),
      body: quizPlayers.when(
        data: (quizPlayersList) => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: quizPlayersList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 70,
                right: 70,
              ),
              child: Card(
                child: ListTile(
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
                ),
              ),
            );
          },
        ),
        error: (error, stacktrace) {
          print(error.toString());
          return Text(
            error.toString(),
          );
        },
        loading: () => const LoadingSpinner(),
      ),
    );
  }
}
