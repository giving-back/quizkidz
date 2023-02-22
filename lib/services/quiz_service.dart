// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:quizkidz/models/connection.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/quiz_alert.dart';
import 'package:quizkidz/util/util.dart';

class QuizService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final quizzesCollection = 'quizzes';
  final quizAlertsCollection = 'alerts';
  final userCollection = 'users';
  final quizAnswersSubCollection = 'answers';
  final quizPlayersSubCollection = 'players';

  QuizService(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Quiz? _quizFromFirebase(DocumentSnapshot? snapshot) => snapshot == null
      ? null
      : Quiz.fromJson(snapshot.data() as Map<String, dynamic>);

  List<Quiz> _quizzesFromFirebase(QuerySnapshot? snapshot) => snapshot == null
      ? []
      : snapshot.docs.map(
          (DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Quiz.fromJson(data);
          },
        ).toList();

  List<QuizAlert> _quizAlertsFromFirebase(QuerySnapshot? snapshot) =>
      snapshot == null
          ? []
          : snapshot.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return QuizAlert.fromJson(data);
              },
            ).toList();

  Stream<List<Quiz>> activeQuizzes() => _firebaseFirestore
      .collection(quizzesCollection)
      .where('active', isEqualTo: true)
      .orderBy('created', descending: true)
      .snapshots()
      .map(_quizzesFromFirebase);

  Stream<Quiz?> quizById(String id) => _firebaseFirestore
      .collection(quizzesCollection)
      .doc(id)
      .snapshots()
      .map(_quizFromFirebase);

  Stream<List<QuizAlert>> unreadQuizAlerts() => _firebaseFirestore
      .collection(quizAlertsCollection)
      .where('receiverId', isEqualTo: _firebaseAuth.currentUser?.uid)
      .where('read', isEqualTo: false)
      .orderBy('raised', descending: true)
      .snapshots()
      .map(_quizAlertsFromFirebase);

  Future<Either<Exception, String>> startNewQuiz(
          {required Quiz quiz, required List<Connection> followers}) async =>
      TaskEither.tryCatch(
        () async {
          final ref = _firebaseFirestore
              .collection(quizzesCollection)
              .withConverter<Quiz>(
                fromFirestore: (snapshot, _) => Quiz.fromJson(snapshot.data()!),
                toFirestore: (quiz, _) => quiz.toJson(),
              )
              .doc();

          quiz.id = ref.id;

          await ref.set(
            quiz,
          );

          final batch = _firebaseFirestore.batch();

          for (var follower in followers) {
            batch.set(
              _firebaseFirestore.collection(quizAlertsCollection).doc(),
              QuizAlert(
                receiverId: follower.follower,
                senderName: quiz.quizmaster.appDisplayName,
                senderId: quiz.quizmaster.uid,
                quizId: quiz.id,
                raised: DateTime.now(),
              ).toJson(),
            );
          }

          await batch.commit();

          return ref.id;
        },
        (error, stackTrace) {
          return Exception(kUserError);
        },
      ).run();

  Future<Either<Exception, void>> deleteQuizAlert(
          {required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          WriteBatch batch = _firebaseFirestore.batch();

          final alertRef = await _firebaseFirestore
              .collection(quizAlertsCollection)
              .where('quizId', isEqualTo: quizId)
              .where('receiverId', isEqualTo: _firebaseAuth.currentUser?.uid)
              .get();

          for (var doc in alertRef.docs) {
            batch.delete(doc.reference);
          }

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> markQuizAlertAsRead(
          {required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          WriteBatch batch = _firebaseFirestore.batch();

          final ref = await _firebaseFirestore
              .collection(quizAlertsCollection)
              .where('quizId', isEqualTo: quizId)
              .where('receiverId', isEqualTo: _firebaseAuth.currentUser?.uid)
              .get();

          for (var doc in ref.docs) {
            batch.update(doc.reference, {'read': true});
          }

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> endQuiz({required String quizId}) async =>
      TaskEither.tryCatch(
        () async => _firebaseFirestore
            .collection(quizzesCollection)
            .doc(quizId)
            .update({'active': false}),
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> deleteQuiz({required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          WriteBatch batch = _firebaseFirestore.batch();

          final quizAlertsRef = await _firebaseFirestore
              .collection(quizAlertsCollection)
              .where('quizId', isEqualTo: quizId)
              .get();

          for (var doc in quizAlertsRef.docs) {
            batch.delete(doc.reference);
          }

          final quizAnswersRef = await _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizAnswersSubCollection)
              .get();

          for (var doc in quizAnswersRef.docs) {
            batch.delete(doc.reference);
          }

          final quizPlayersRef = await _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizPlayersSubCollection)
              .get();

          for (var doc in quizPlayersRef.docs) {
            batch.delete(doc.reference);
          }

          batch.delete(
              _firebaseFirestore.collection(quizzesCollection).doc(quizId));

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();
}
