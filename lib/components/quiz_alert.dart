// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/date_format_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';

class QuizAlert extends ConsumerWidget {
  const QuizAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizAlerts = ref.watch(quizAlertsProvider);
    final dateFormatter = ref.watch(dateFormatServiceProvider);

    return quizAlerts.when(
      data: (data) {
        final newQuizAlerts = data.where((element) => !element.read).length;

        return PopupMenuButton(
          tooltip: '',
          iconSize: 30,
          icon: badges.Badge(
            showBadge: newQuizAlerts > 0,
            badgeContent: Text(
              newQuizAlerts.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            badgeAnimation: const badges.BadgeAnimation.scale(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            child: const Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
          itemBuilder: (context) => data
              .map(
                (d) => PopupMenuItem(
                  child: Text(
                      '${d.sender} started a quiz ${dateFormatter.formatDate(d.raised)}'),
                ),
              )
              .toList(),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const LoadingSpinner(),
    );
  }
}
