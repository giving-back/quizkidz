// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/models/app_user.dart';

// Project imports:
import 'package:quizkidz/services/auth_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);

final authServicesProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.read(firebaseAuthProvider),
    ref.read(firestoreProvider),
  );
});

final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authServicesProvider).user;
});

final appUserByIdProvider =
    StreamProvider.autoDispose.family<AppUser?, String>((ref, uid) {
  return ref.watch(authServicesProvider).appUserStreamById(uid);
});
