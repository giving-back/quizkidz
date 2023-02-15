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
  final String friendsSubCollection = 'friends';

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
    return snapshot.docs.map(
      (DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return AppUser.fromJson(data);
      },
    ).toList();
  }

  List<Friend> _friendsFromFirestore(QuerySnapshot? snapshot) {
    if (snapshot == null) {
      return [];
    }
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

  Stream<List<Friend>> friends(String uid) => _firebaseFirestore
      .collection(usersCollection)
      .doc(uid)
      .collection(friendsSubCollection)
      .orderBy('matched', descending: true)
      .snapshots()
      .map(_friendsFromFirestore);

  Future<Either<Exception, void>> addNewAppUser(AppUser appUser) async =>
      TaskEither.tryCatch(
        () => _firebaseFirestore
            .collection(usersCollection)
            .doc(appUser.uid)
            .set(appUser.toJson()),
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
