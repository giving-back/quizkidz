// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/quiz_alert.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/util/util.dart';

class QuizService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final quizzesCollection = 'quizzes';
  final quizAlertsSubCollection = 'alerts';
  final userCollection = 'users';

  QuizService(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Quiz? _quizFromFirebase(DocumentSnapshot? snapshot) => snapshot == null
      ? null
      : Quiz.fromJson(snapshot.data() as Map<String, dynamic>);

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

  Stream<Quiz?> quizById(String id) => _firebaseFirestore
      .collection(quizzesCollection)
      .doc(id)
      .snapshots()
      .map(_quizFromFirebase);

  Stream<List<QuizAlert>> quizAlerts() => _firebaseFirestore
      .collection(userCollection)
      .doc(_firebaseAuth.currentUser?.uid)
      .collection(quizAlertsSubCollection)
      .snapshots()
      .map(_quizAlertsFromFirebase);

  Future<Either<Exception, String>> startNewQuiz(
          {required Quiz quiz, required List<Friend> followers}) async =>
      TaskEither.tryCatch(
        () async {
          final quizId = await _firebaseFirestore
              .collection(quizzesCollection)
              .withConverter<Quiz>(
                fromFirestore: (snapshot, _) => Quiz.fromJson(snapshot.data()!),
                toFirestore: (quiz, _) => quiz.toJson(),
              )
              .add(
                quiz,
              )
              .then((value) => value.id);

          final batch = _firebaseFirestore.batch();

          for (var follow in followers) {
            var ref = _firebaseFirestore
                .collection(userCollection)
                .doc(follow.uid)
                .collection(quizAlertsSubCollection)
                .doc();

            batch.set(
              ref,
              QuizAlert(
                sender: quiz.quizmaster.appDisplayName,
                quizId: quizId,
                raised: DateTime.now(),
              ).toJson(),
            );
          }

          await batch.commit();

          return quizId;
        },
        (error, stackTrace) {
          return Exception(kUserError);
        },
      ).run();
}
