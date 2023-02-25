// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';

class QuizAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String quizId;
  final List<PopupMenuEntry<int>> entries;

  const QuizAppBar({
    Key? key,
    required this.quizId,
    required this.entries,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizService = ref.watch(quizServiceProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(kBlueColor),
      elevation: 0,
      actions: [
        PopupMenuButton<int>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          splashRadius: 24,
          offset: const Offset(0, 40),
          onSelected: (item) async {
            switch (item) {
              case 0:
                await quizService.leaveQuiz(quizId: quizId).then(
                      (value) => value.match(
                        (error) => print(error.toString()),
                        (result) {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
            }
          },
          itemBuilder: (context) => entries,
        ),
      ],
    );
  }
}
