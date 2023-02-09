// Package imports:
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/services/storage_service.dart';

final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});

final storageServicesProvider = Provider<StorageService>((ref) {
  return StorageService(
    ref.read(firebaseStorageProvider),
  );
});

final getDownloadURLProvider =
    FutureProvider.autoDispose.family<String, String>((ref, child) {
  return ref.watch(storageServicesProvider).getDownloadURL(child);
});
