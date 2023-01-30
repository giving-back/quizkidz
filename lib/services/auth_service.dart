import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/util/util.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  AppUser? _appUserFromFirebase(User? user) {
    if (user == null) {
      return null;
    }

    return AppUser(
      uid: user.uid,
      email: user.email,
      authDisplayName: user.displayName,
      authPhotoURL: user.photoURL,
    );
  }

  Stream<AppUser?> get user {
    return _firebaseAuth.authStateChanges().asyncMap(_appUserFromFirebase);
  }

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
