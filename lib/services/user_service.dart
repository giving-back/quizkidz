// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quizkidz/models/app_user.dart';

import '../util/util.dart';

class UserService {
  final FirebaseFirestore _firebaseFirestore;

  final usersCollection = 'users';

  UserService(this._firebaseFirestore);

  Future<bool> doesUserExist(String id) async {
    bool exist = false;
    await _firebaseFirestore.collection(usersCollection).doc(id).get().then(
      (doc) {
        exist = doc.exists;
      },
    );
    return exist;
  }

  Future<Either<Exception, void>> addNewAppUser(AppUser appUser) async =>
      TaskEither.tryCatch(
        () => _firebaseFirestore
            .collection(usersCollection)
            .doc(appUser.uid)
            .set(appUser.toJson()),
        (error, stackTrace) => Exception(kUserError),
      ).run();
}
