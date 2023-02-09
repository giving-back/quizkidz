import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/services/quiz_service.dart';

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);

final quizServiceProvider = Provider<QuizService>((ref) {
  return QuizService(
    ref.read(firestoreProvider),
  );
});

final quizByIdProvider =
    StreamProvider.autoDispose.family<Quiz?, String>((ref, id) {
  return ref.watch(quizServiceProvider).quizById(id);
});
