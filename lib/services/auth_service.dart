// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/util/util.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final String usersCollection = 'users';

  AuthService(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Future<AppUser?> _appUserFromFirebase(User? user) async {
    if (user == null) {
      return null;
    }

    return await appUserById(user.uid) ??
        AppUser(
          uid: user.uid,
          email: user.email,
          authDisplayName: user.displayName,
          authPhotoURL: user.photoURL,
        );
  }

  AppUser? _appUserFromFirestore(DocumentSnapshot snapshot) {
    if (!snapshot.exists) {
      return null;
    }
    return AppUser.fromJson(
      snapshot.data()! as Map<String, dynamic>,
    );
  }

  Stream<AppUser?> get user {
    return _firebaseAuth.authStateChanges().asyncMap(_appUserFromFirebase);
  }

  Future<AppUser?> appUserById(String uid) async {
    return _appUserFromFirestore(
        await _firebaseFirestore.collection(usersCollection).doc(uid).get());
  }

  Stream<AppUser?> appUserStreamById(String uid) => _firebaseFirestore
      .collection(usersCollection)
      .doc(uid)
      .snapshots()
      .map(_appUserFromFirestore);

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
