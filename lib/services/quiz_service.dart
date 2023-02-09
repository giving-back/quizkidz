// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/util/util.dart';

class QuizService {
  final FirebaseFirestore _firebaseFirestore;
  final quizzesCollection = 'quizzes';

  QuizService(
    this._firebaseFirestore,
  );

  Future<Either<Exception, String>> startNewQuiz(Quiz quiz) async =>
      TaskEither.tryCatch(
        () => _firebaseFirestore
            .collection(quizzesCollection)
            .withConverter<Quiz>(
              fromFirestore: (snapshot, _) => Quiz.fromJson(snapshot.data()!),
              toFirestore: (quiz, _) => quiz.toJson(),
            )
            .add(
              quiz,
            )
            .then((value) => value.id),
        (error, stackTrace) {
          print(stackTrace);
          return Exception(kUserError);
        },
      ).run();
}
