// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final unreadQuizAlerts = ref.watch(unreadQuizAlertsProvider);
    final dateFormatter = ref.watch(dateFormatServiceProvider);
    final quizService = ref.watch(quizServiceProvider);

    return unreadQuizAlerts.when(
      data: (unreadQuizAlertList) {
        return PopupMenuButton(
          tooltip: '',
          iconSize: 30,
          icon: badges.Badge(
            showBadge: unreadQuizAlertList.isNotEmpty,
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.redAccent,
            ),
            badgeContent: Text(
              unreadQuizAlertList.length.toString(),
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
          itemBuilder: (context) => unreadQuizAlertList
              .map(
                (d) => PopupMenuItem(
                  onTap: () {
                    quizService.markQuizAlertAsRead(uid: d.uid).then(
                          (value) => value.match(
                              (error) => print(error.toString()),
                              (result) => null),
                        );
                  },
                  child: Column(
                    children: [
                      Text(
                        '${d.sender} started a quiz ${dateFormatter.formatDate(d.raised)}. Click to join.',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () => const LoadingSpinner(),
    );
  }
}
