// Package imports:
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/services/storage_service.dart';

final firebaseStorageProvider =
    Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);

final storageServicesProvider = Provider<StorageService>(
  (ref) => StorageService(
    ref.watch(firebaseStorageProvider),
  ),
);

final getDownloadURLProvider =
    FutureProvider.autoDispose.family<String, String>(
  (ref, child) => ref.watch(storageServicesProvider).getDownloadURL(child),
);

final quizTypesProvider = Provider<List<QuizType>>(
  (ref) => ref.watch(storageServicesProvider).quizTypes(),
);

final numQuestionsProvider = Provider<List<int>>(
  (ref) => ref.watch(storageServicesProvider).numQuestions(),
);
