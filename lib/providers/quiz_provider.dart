// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/quiz_alert.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/state_provider.dart';
import 'package:quizkidz/services/quiz_service.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final quizServiceProvider = Provider<QuizService>((ref) => QuizService(
      ref.watch(authServicesProvider),
      ref.watch(firestoreProvider),
      ref.read(questionIndexProvider.notifier),
    ));

final activeQuizzesProvider = StreamProvider.autoDispose<List<Quiz>>(
    (ref) => ref.watch(quizServiceProvider).activeQuizzes);

final quizByIdProvider = StreamProvider.autoDispose.family<Quiz?, String>(
    (ref, id) => ref.watch(quizServiceProvider).quizById(id));

final unreadQuizAlertsProvider = StreamProvider.autoDispose<List<QuizAlert>>(
    (ref) => ref.watch(quizServiceProvider).unreadQuizAlerts);

final quizPlayersProvider = StreamProvider.autoDispose
    .family<List<QuizPlayer>, String>(
        (ref, id) => ref.watch(quizServiceProvider).quizPlayers(id));

final quizAnswersProvider = StreamProvider.autoDispose
    .family<List<QuizAnswer>, String>(
        (ref, id) => ref.watch(quizServiceProvider).quizAnswers(id));

final myQuizAnswerProvider = StreamProvider.autoDispose
    .family<QuizAnswer?, String>(
        (ref, id) => ref.watch(quizServiceProvider).myQuizAnswer(id));

final quizQuestionsProvider = StreamProvider.autoDispose<List<QuizQuestion>>(
    (ref) => ref.watch(quizServiceProvider).quizQuestions);
