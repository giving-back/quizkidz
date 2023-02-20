// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/date_format_provider.dart';
import 'package:quizkidz/providers/quiz_provider.dart';
import 'package:quizkidz/util/util.dart';
import 'package:quizkidz/wrappers/quiz_wrapper.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unreadQuizAlerts = ref.watch(unreadQuizAlertsProvider);
    final dateFormatter = ref.watch(dateFormatServiceProvider);
    final quizService = ref.watch(quizServiceProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
      body: unreadQuizAlerts.when(
        data: (unreadQuizAlertsList) => ListView.builder(
          itemCount: unreadQuizAlertsList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 8,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(kWhiteColor),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'new quiz',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      dateFormatter
                          .formatDate(unreadQuizAlertsList[index].raised),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${unreadQuizAlertsList[index].senderName} started a new quiz.',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          quizService
                              .markQuizAlertAsRead(
                                quizId: unreadQuizAlertsList[index].quizId,
                              )
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
                                      quizid:
                                          unreadQuizAlertsList[index].quizId,
                                    ),
                                  ),
                                ),
                              );
                        },
                        child: const Text(
                          'Join here',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
        error: (error, stackTrace) => Text(
          error.toString(),
        ),
        loading: () => const LoadingSpinner(),
      ),
    );
  }
}
