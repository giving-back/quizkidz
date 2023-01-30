// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/models/app_user.dart';

// Project imports:
import 'package:quizkidz/services/auth_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServicesProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authServicesProvider).user;
});
