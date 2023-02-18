// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_badge/icon_badge.dart';

// Package imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/quiz_provider.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizAlerts = ref.watch(quizAlertsProvider);

    return AppBar(
      backgroundColor: const Color(kBlueColor),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: quizAlerts.when(
            data: (data) {
              final newQuizAlerts =
                  data.where((element) => !element.read).length;
              return IconBadge(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black54,
                  size: 30,
                ),
                itemCount: newQuizAlerts,
                badgeColor: Colors.red.shade400,
                itemColor: Colors.white,
                hideZero: true,
                onTap: () {
                  print('test');
                },
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const LoadingSpinner(),
          ),
        ),
      ],
    );
  }
}
