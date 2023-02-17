// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quizkidz/models/alert.dart';

// Project imports:
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/util/util.dart';

class QuizService {
  final FirebaseFirestore _firebaseFirestore;
  final quizzesCollection = 'quizzes';
  final alertsSubCollection = 'alerts';
  final userCollection = 'users';

  QuizService(
    this._firebaseFirestore,
  );

  Quiz? _quizFromFirebase(DocumentSnapshot? snapshot) => snapshot == null
      ? null
      : Quiz.fromJson(snapshot.data() as Map<String, dynamic>);

  Future<Either<Exception, String>> startNewQuiz(
          {required Quiz quiz, required List<Friend> following}) async =>
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

          for (var follow in following) {
            var ref = _firebaseFirestore
                .collection(userCollection)
                .doc(follow.uid)
                .collection(alertsSubCollection)
                .doc();

            batch.set(
              ref,
              Alert(uid: follow.uid, message: quizId).toJson(),
            );
          }

          await batch.commit();

          return quizId;
        },
        (error, stackTrace) {
          return Exception(kUserError);
        },
      ).run();

  Stream<Quiz?> quizById(String id) => _firebaseFirestore
      .collection(quizzesCollection)
      .doc(id)
      .snapshots()
      .map(_quizFromFirebase);
}
