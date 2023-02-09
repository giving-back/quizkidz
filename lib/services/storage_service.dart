// Package imports:
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage;

  StorageService(
    this._firebaseStorage,
  );

  Future<String> getDownloadURL(String child) async =>
      _firebaseStorage.ref().child(child).getDownloadURL();
}
