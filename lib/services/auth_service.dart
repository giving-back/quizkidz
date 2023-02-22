// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Project imports:
import 'package:quizkidz/models/connection.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/util/util.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final String usersCollection = 'users';
  final String connectionsCollection = 'connections';
  final String quizzesCollection = 'quizzes';
  final String quizAlertsCollection = 'alerts';

  AuthService(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Future<AppUser?> _appUserFromFirebase(User? user) async => user == null
      ? null
      : await appUserById(user.uid) ??
          AppUser(
            uid: user.uid,
            email: user.email,
            authDisplayName: user.displayName,
            authPhotoURL: user.photoURL,
          );

  AppUser? _appUserFromFirestore(DocumentSnapshot snapshot) => !snapshot.exists
      ? null
      : AppUser.fromJson(
          snapshot.data()! as Map<String, dynamic>,
        );

  List<AppUser> _appUsersFromFirestore(QuerySnapshot? snapshot) {
    if (snapshot == null) {
      return [];
    }

    List<AppUser> users = snapshot.docs.map(
      (DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return AppUser.fromJson(data);
      },
    ).toList();

    // Remove the active user from the list
    users.removeWhere((item) => item.uid == _firebaseAuth.currentUser!.uid);

    return users;
  }

  List<Connection> _connectionsFromFirestore(QuerySnapshot? snapshot) =>
      snapshot == null
          ? []
          : snapshot.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Connection.fromJson(data);
              },
            ).toList();

  Future<AppUser?> appUserById(String uid) async => _appUserFromFirestore(
      await _firebaseFirestore.collection(usersCollection).doc(uid).get());

  Future<AppUser?> activeAppUser() async =>
      _appUserFromFirestore(await _firebaseFirestore
          .collection(usersCollection)
          .doc(currentUserId)
          .get());

  Stream<AppUser?> get user =>
      _firebaseAuth.authStateChanges().asyncMap(_appUserFromFirebase);

  String get currentUserId => _firebaseAuth.currentUser!.uid;

  Stream<AppUser?> activeAppUserStream() => _firebaseFirestore
      .collection(usersCollection)
      .doc(_firebaseAuth.currentUser?.uid)
      .snapshots()
      .map(_appUserFromFirestore);

  Stream<List<AppUser>> activeAppUsersStream() => _firebaseFirestore
      .collection(usersCollection)
      .snapshots()
      .map(_appUsersFromFirestore);

  Stream<List<Connection>> followingStream() => _firebaseFirestore
      .collection(connectionsCollection)
      .where('follower', isEqualTo: _firebaseAuth.currentUser?.uid)
      .snapshots()
      .map(_connectionsFromFirestore);

  Stream<List<Connection>> followersStream() => _firebaseFirestore
      .collection(connectionsCollection)
      .where('following', isEqualTo: _firebaseAuth.currentUser?.uid)
      .snapshots()
      .map(_connectionsFromFirestore);

  Future<Either<Exception, void>> addNewAppUser(AppUser appUser) async =>
      TaskEither.tryCatch(
        () => _firebaseFirestore
            .collection(usersCollection)
            .doc(appUser.uid)
            .set(appUser.toJson()),
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> deleteActiveAppUser() async =>
      TaskEither.tryCatch(
        () async {
          WriteBatch batch = _firebaseFirestore.batch();

          final quizRef = await _firebaseFirestore
              .collection(quizzesCollection)
              .where('quizmaster.uid',
                  isEqualTo: _firebaseAuth.currentUser?.uid)
              .get();

          for (var doc in quizRef.docs) {
            batch.delete(doc.reference);
          }

          final followingRef = await _firebaseFirestore
              .collection(connectionsCollection)
              .where('following', isEqualTo: _firebaseAuth.currentUser?.uid)
              .get();

          for (var doc in followingRef.docs) {
            batch.delete(doc.reference);
          }

          final followerRef = await _firebaseFirestore
              .collection(connectionsCollection)
              .where('follower', isEqualTo: _firebaseAuth.currentUser?.uid)
              .get();

          for (var doc in followerRef.docs) {
            batch.delete(doc.reference);
          }

          final quizAlertsSentRef = await _firebaseFirestore
              .collection(quizAlertsCollection)
              .where('senderId', isEqualTo: _firebaseAuth.currentUser?.uid)
              .get();

          for (var doc in quizAlertsSentRef.docs) {
            batch.delete(doc.reference);
          }

          final quizAlertsReceivedRef = await _firebaseFirestore
              .collection(quizAlertsCollection)
              .where('receiverId', isEqualTo: _firebaseAuth.currentUser?.uid)
              .get();

          for (var doc in quizAlertsReceivedRef.docs) {
            batch.delete(doc.reference);
          }

          final usersRef = _firebaseFirestore
              .collection(usersCollection)
              .doc(_firebaseAuth.currentUser?.uid);

          batch.delete(usersRef);

          return batch.commit();
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> followUser(String uid) async =>
      TaskEither.tryCatch(
        () => _firebaseFirestore.collection(connectionsCollection).add(
              Connection(
                follower: _firebaseAuth.currentUser!.uid,
                following: uid,
              ).toJson(),
            ),
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> unfollowUser(String uid) async =>
      TaskEither.tryCatch(
        () {
          WriteBatch batch = _firebaseFirestore.batch();

          return _firebaseFirestore
              .collection(connectionsCollection)
              .where('follower', isEqualTo: _firebaseAuth.currentUser?.uid)
              .where('following', isEqualTo: uid)
              .get()
              .then(
            (querySnapshot) {
              for (var document in querySnapshot.docs) {
                batch.delete(document.reference);
              }

              return batch.commit();
            },
          );
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> signInWithApple() async =>
      TaskEither.tryCatch(
        () => SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        ).then(
          (credential) {
            print(credential);
          },
        ),
        (error, stackTrace) {
          print(error);
          print(stackTrace);
          return Exception(kUserError);
        },
      ).run();

  Future<Either<Exception, void>> signInWithGoogle() async =>
      TaskEither.tryCatch(
        () => GoogleSignIn().signIn().then(
          (gUser) async {
            await gUser!.authentication.then(
              (gAuth) async {
                final googleCredential = GoogleAuthProvider.credential(
                  accessToken: gAuth.accessToken,
                  idToken: gAuth.idToken,
                );
                await _firebaseAuth.signInWithCredential(
                  googleCredential,
                );
              },
            );
          },
        ),
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> signOut() async => TaskEither.tryCatch(
        () => _firebaseAuth.signOut(),
        (error, stackTrace) => Exception(kUserError),
      ).run();
}
