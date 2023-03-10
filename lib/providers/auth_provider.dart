// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/models/connection.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/services/auth_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final authServicesProvider = Provider<AuthService>(
  (ref) => AuthService(
    ref.watch(firebaseAuthProvider),
    ref.watch(firestoreProvider),
  ),
);

final authStateProvider = StreamProvider<AppUser?>(
  (ref) => ref.watch(authServicesProvider).user,
);

final activeAppUserProvider = StreamProvider.autoDispose<AppUser?>(
  (ref) => ref.watch(authServicesProvider).activeAppUserStream(),
);

final activeAppUsersProvider = StreamProvider.autoDispose<List<AppUser>>(
  (ref) => ref.watch(authServicesProvider).activeAppUsersStream(),
);

final followingProvider = StreamProvider.autoDispose<List<Connection>>(
  (ref) => ref.watch(authServicesProvider).followingStream(),
);

final followersProvider = StreamProvider.autoDispose<List<Connection>>(
  (ref) => ref.watch(authServicesProvider).followersStream(),
);
