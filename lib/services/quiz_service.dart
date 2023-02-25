import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:quizkidz/models/connection.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/models/quiz_alert.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/services/auth_service.dart';
import 'package:quizkidz/util/util.dart';

class QuizService {
  final AuthService _authService;
  final FirebaseFirestore _firebaseFirestore;
  final _questionIndexNotifier;

  final quizzesCollection = 'quizzes';
  final quizAlertsCollection = 'alerts';
  final quizQuestionsCollection = 'questions';
  final quizAnswersSubCollection = 'answers';
  final quizPlayersSubCollection = 'players';
  final usersCollection = 'users';

  QuizService(
    this._authService,
    this._firebaseFirestore,
    this._questionIndexNotifier,
  );

  Quiz? _quizFromFirebase(DocumentSnapshot? snapshot) =>
      snapshot == null || !snapshot.exists
          ? null
          : Quiz.fromJson(snapshot.data() as Map<String, dynamic>);

  QuizAnswer? _quizAnswerFromFirebase(DocumentSnapshot? snapshot) =>
      snapshot == null || !snapshot.exists
          ? null
          : QuizAnswer.fromJson(snapshot.data() as Map<String, dynamic>);

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

  List<QuizPlayer> _quizPlayersFromFirebase(QuerySnapshot? snapshot) =>
      snapshot == null
          ? []
          : snapshot.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return QuizPlayer.fromJson(data);
              },
            ).toList();

  List<QuizAnswer> _quizAnswersFromFirebase(QuerySnapshot? snapshot) =>
      snapshot == null
          ? []
          : snapshot.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return QuizAnswer.fromJson(data);
              },
            ).toList();

  List<QuizQuestion> _quizQuestionsFromFirebase(QuerySnapshot? snapshot) =>
      snapshot == null
          ? []
          : snapshot.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return QuizQuestion.fromJson(data);
              },
            ).toList();

  Stream<List<Quiz>> get activeQuizzes => _firebaseFirestore
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

  Stream<List<QuizAlert>> get unreadQuizAlerts => _firebaseFirestore
      .collection(quizAlertsCollection)
      .where('receiverId', isEqualTo: _authService.currentUserId)
      .where('read', isEqualTo: false)
      .orderBy('raised', descending: true)
      .snapshots()
      .map(_quizAlertsFromFirebase);

  Stream<List<QuizPlayer>> quizPlayers(String quizId) => _firebaseFirestore
      .collection(quizzesCollection)
      .doc(quizId)
      .collection(quizPlayersSubCollection)
      .orderBy('score', descending: true)
      .orderBy('player.appDisplayName')
      .snapshots()
      .map(_quizPlayersFromFirebase);

  Stream<List<QuizAnswer>> quizAnswers(String quizId) => _firebaseFirestore
      .collection(quizzesCollection)
      .doc(quizId)
      .collection(quizAnswersSubCollection)
      .orderBy('buzzed')
      .snapshots()
      .map(_quizAnswersFromFirebase);

  Stream<List<QuizQuestion>> get quizQuestions => _firebaseFirestore
      .collection(quizQuestionsCollection)
      .snapshots()
      .map(_quizQuestionsFromFirebase);

  Stream<QuizAnswer?> myQuizAnswer(String quizId) => _firebaseFirestore
      .collection(quizzesCollection)
      .doc(quizId)
      .collection(quizAnswersSubCollection)
      .doc(_authService.currentUserId)
      .snapshots()
      .map(_quizAnswerFromFirebase);

  Future<Either<Exception, String>> startNewQuiz(
          {required Quiz quiz, required List<Connection> followers}) async =>
      TaskEither.tryCatch(
        () async {
          _questionIndexNotifier.state = 0;

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
              .where('receiverId', isEqualTo: _authService.currentUserId)
              .get();

          for (var doc in alertRef.docs) {
            batch.delete(doc.reference);
          }

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> joinQuiz({required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          final quiz = _quizFromFirebase(
            await _firebaseFirestore
                .collection(quizzesCollection)
                .doc(quizId)
                .get(),
          );

          if (quiz!.quizmaster.uid == _authService.currentUserId) {
            _questionIndexNotifier.state = quiz.currentQuestionNumber;
            return;
          }

          WriteBatch batch = _firebaseFirestore.batch();

          final ref = await _firebaseFirestore
              .collection(quizAlertsCollection)
              .where('quizId', isEqualTo: quizId)
              .where('receiverId', isEqualTo: _authService.currentUserId)
              .get();

          for (var doc in ref.docs) {
            batch.update(doc.reference, {'read': true});
          }

          final activeUser = await _authService.activeAppUser();

          final player = QuizPlayer(
            player: QuizUser(
                uid: activeUser!.uid,
                appDisplayName: activeUser.appDisplayName,
                appAvatar: activeUser.appAvatar,
                appAvatarColor: activeUser.appAvatarColor),
          );

          final playerRef = _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizPlayersSubCollection)
              .withConverter<QuizPlayer>(
                fromFirestore: (snapshot, _) =>
                    QuizPlayer.fromJson(snapshot.data()!),
                toFirestore: (quiz, _) => player.toJson(),
              )
              .doc(player.player.uid);

          batch.set(playerRef, player);

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> leaveQuiz({required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          final quiz = _quizFromFirebase(
            await _firebaseFirestore
                .collection(quizzesCollection)
                .doc(quizId)
                .get(),
          );

          if (quiz!.quizmaster.uid != _authService.currentUserId) {
            return;
          }

          return _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .update({'currentQuestionNumber': _questionIndexNotifier.state});
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> endQuiz({required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          WriteBatch batch = _firebaseFirestore.batch();

          final quizRef =
              _firebaseFirestore.collection(quizzesCollection).doc(quizId);

          List<QuizPlayer> players = _quizPlayersFromFirebase(
            await _firebaseFirestore
                .collection(quizzesCollection)
                .doc(quizId)
                .collection(quizPlayersSubCollection)
                .orderBy('score', descending: true)
                .get(),
          );

          if (players.isNotEmpty) {
            batch.update(quizRef, {'winner': players.first.toJson()});

            final userRef = _firebaseFirestore
                .collection(usersCollection)
                .doc(players.first.player.uid);

            batch.update(
              userRef,
              {
                'quizWins': FieldValue.increment(1),
              },
            );

            final playerIds =
                players.map((player) => player.player.uid).toList();

            final users = await _firebaseFirestore
                .collection(usersCollection)
                .where('uid', whereIn: playerIds)
                .get();

            for (var user in users.docs) {
              batch.update(
                user.reference,
                {
                  'questionsAnswered': FieldValue.increment(players
                      .firstWhere((element) => element.player.uid == user.id)
                      .score),
                },
              );
            }
          }

          final quizAlertsRef = await _firebaseFirestore
              .collection(quizAlertsCollection)
              .where('quizId', isEqualTo: quizId)
              .get();

          for (var doc in quizAlertsRef.docs) {
            batch.delete(doc.reference);
          }

          batch.update(quizRef, {'active': false});

          return batch.commit();
        },
        (error, stackTrace) {
          print(error.toString());
          return Exception(kUserError);
        },
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

  Future<Either<Exception, void>> deleteQuizAnswer(
          {required String quizId, required String answerId}) async =>
      TaskEither.tryCatch(
        () async {
          return _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizAnswersSubCollection)
              .doc(answerId)
              .delete();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> buzz({required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          final activeUser = await _authService.activeAppUser();

          return await _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizAnswersSubCollection)
              .withConverter<QuizAnswer>(
                fromFirestore: (snapshot, _) =>
                    QuizAnswer.fromJson(snapshot.data()!),
                toFirestore: (quiz, _) => quiz.toJson(),
              )
              .doc(activeUser!.uid)
              .set(
                QuizAnswer(
                  player: QuizUser(
                    uid: activeUser.uid,
                    appDisplayName: activeUser.appDisplayName,
                    appAvatar: activeUser.appAvatar,
                    appAvatarColor: activeUser.appAvatarColor,
                  ),
                  buzzed: DateTime.now(),
                ),
              );
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> correctAnswer(
          {required String quizId, required String playerId}) async =>
      TaskEither.tryCatch(
        () async {
          WriteBatch batch = _firebaseFirestore.batch();

          final quizPlayerRef = _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizPlayersSubCollection)
              .doc(playerId);

          batch.update(
            quizPlayerRef,
            {
              'score': FieldValue.increment(1),
            },
          );

          final quizAnswersRef = await _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizAnswersSubCollection)
              .get();

          for (var doc in quizAnswersRef.docs) {
            batch.delete(doc.reference);
          }

          _questionIndexNotifier.state += 1;

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> endQuestion({required String quizId}) async =>
      TaskEither.tryCatch(
        () async {
          _questionIndexNotifier.state += 1;
          WriteBatch batch = _firebaseFirestore.batch();

          final quizAnswersRef = await _firebaseFirestore
              .collection(quizzesCollection)
              .doc(quizId)
              .collection(quizAnswersSubCollection)
              .get();

          for (var doc in quizAnswersRef.docs) {
            batch.delete(doc.reference);
          }

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();
}
