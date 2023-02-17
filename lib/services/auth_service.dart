// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Project imports:
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/util/util.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final String usersCollection = 'users';
  final String followingSubCollection = 'following';
  final String followersSubCollection = 'followers';

  AuthService(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Future<AppUser?> _appUserFromFirebase(User? user) async => user == null
      ? null
      : await _appUserById(user.uid) ??
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

  List<Friend> _friendFromFirestore(QuerySnapshot? snapshot) {
    if (snapshot == null) {
      return [];
    }

    final test = snapshot.docs.map(
      (DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return Friend.fromJson(data);
      },
    ).toList();

    return snapshot.docs.map(
      (DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return Friend.fromJson(data);
      },
    ).toList();
  }

  Future<AppUser?> _appUserById(String uid) async => _appUserFromFirestore(
      await _firebaseFirestore.collection(usersCollection).doc(uid).get());

  Stream<AppUser?> get user =>
      _firebaseAuth.authStateChanges().asyncMap(_appUserFromFirebase);

  Stream<AppUser?> activeAppUserStream() => _firebaseFirestore
      .collection(usersCollection)
      .doc(_firebaseAuth.currentUser?.uid)
      .snapshots()
      .map(_appUserFromFirestore);

  Stream<List<AppUser>> activeAppUsersStream() => _firebaseFirestore
      .collection(usersCollection)
      .snapshots()
      .map(_appUsersFromFirestore);

  Stream<List<Friend>> followingStream() => _firebaseFirestore
      .collection(usersCollection)
      .doc(_firebaseAuth.currentUser?.uid)
      .collection(followingSubCollection)
      .snapshots()
      .map(_friendFromFirestore);

  Stream<List<Friend>> followersStream() => _firebaseFirestore
      .collection(usersCollection)
      .doc(_firebaseAuth.currentUser?.uid)
      .collection(followersSubCollection)
      .snapshots()
      .map(_friendFromFirestore);

  Future<Either<Exception, void>> addNewAppUser(AppUser appUser) async =>
      TaskEither.tryCatch(
        () => _firebaseFirestore
            .collection(usersCollection)
            .doc(appUser.uid)
            .set(appUser.toJson()),
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> followUser(String uid) async =>
      TaskEither.tryCatch(
        () async {
          await _firebaseFirestore
              .collection(usersCollection)
              .doc(_firebaseAuth.currentUser?.uid)
              .collection(followingSubCollection)
              .doc(uid)
              .set(
                Friend(uid: uid, added: DateTime.now()).toJson(),
              );

          _firebaseFirestore
              .collection(usersCollection)
              .doc(uid)
              .collection(followersSubCollection)
              .doc(_firebaseAuth.currentUser?.uid)
              .set(
                Friend(
                        uid: _firebaseAuth.currentUser!.uid,
                        added: DateTime.now())
                    .toJson(),
              );
        },
        (error, stackTrace) => Exception(kUserError),
      ).run();

  Future<Either<Exception, void>> unfollowUser(String uid) async =>
      TaskEither.tryCatch(
        () async {
          await _firebaseFirestore
              .collection(usersCollection)
              .doc(_firebaseAuth.currentUser?.uid)
              .collection(followingSubCollection)
              .doc(uid)
              .delete();

          _firebaseFirestore
              .collection(usersCollection)
              .doc(uid)
              .collection(followersSubCollection)
              .doc(_firebaseAuth.currentUser?.uid)
              .delete();
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
