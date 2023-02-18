// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/quiz_alert.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/services/quiz_service.dart';

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);

final quizServiceProvider = Provider<QuizService>((ref) {
  return QuizService(
    ref.watch(firebaseAuthProvider),
    ref.watch(firestoreProvider),
  );
});

final quizByIdProvider =
    StreamProvider.autoDispose.family<Quiz?, String>((ref, id) {
  return ref.watch(quizServiceProvider).quizById(id);
});

final unreadQuizAlertsProvider =
    StreamProvider.autoDispose<List<QuizAlert>>((ref) {
  return ref.watch(quizServiceProvider).unreadQuizAlerts();
});
