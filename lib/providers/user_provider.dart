// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/services/user_service.dart';

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);

final usersCollectionProvider = Provider.autoDispose<UserService>(
  (ref) => UserService(
    ref.read(firestoreProvider),
  ),
);

final doesUserExistProvider = FutureProvider.autoDispose.family<bool, String>(
  (ref, uid) async => ref.read(usersCollectionProvider).doesUserExist(uid),
);
