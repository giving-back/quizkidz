// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/screen/notifications_screen.dart';

class QuizAlert extends ConsumerWidget {
  const QuizAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unreadQuizAlerts = ref.watch(unreadQuizAlertsProvider);

    return unreadQuizAlerts.when(
      data: (unreadQuizAlertList) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            customBorder: const CircleBorder(),
            child: badges.Badge(
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
                Icons.notifications_none_outlined,
                //size: 30,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        print(error.toString());
        return Text(error.toString());
      },
      loading: () => const LoadingSpinner(),
    );
  }
}
