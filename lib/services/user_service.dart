// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
