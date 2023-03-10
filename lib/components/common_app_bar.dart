// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/quiz_alert.dart';
import 'package:quizkidz/util/util.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool showAlert;
  const CommonAppBar({
    Key? key,
    required this.showAlert,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: const Color(kBlueColor),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: showAlert ? const QuizAlert() : Container(),
        ),
      ],
    );
  }
}
