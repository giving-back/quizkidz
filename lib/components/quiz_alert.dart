// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/date_format_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/wrappers/quiz_wrapper.dart';

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
                (unreadQuizAlert) => PopupMenuItem(
                  onTap: () {
                    quizService
                        .markQuizAlertAsRead(uid: unreadQuizAlert.uid)
                        .then(
                          (value) => value.match(
                              (error) => print(error.toString()),
                              (result) => null),
                        )
                        .then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizWrapper(
                                quizid: unreadQuizAlert.quizId,
                              ),
                            ),
                          ),
                        );
                  },
                  child: Column(
                    children: [
                      Text(
                        '${unreadQuizAlert.sender} started a quiz ${dateFormatter.formatDate(unreadQuizAlert.raised)}. Click to join.',
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
