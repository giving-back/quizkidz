// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class AppUser with _$AppUser {
  factory AppUser({
    required final String uid,
    required final String? email,
    required final String? authDisplayName,
    required final String? authPhotoURL,
    @Default(true) bool firstTimeUser,
    @Default('') String appDisplayName,
    @Default('') String appAvatar,
    @Default(1) int appAvatarColor,
    @Default(0) int quizWins,
    @Default(0) int questionsAnswered,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}

@Freezed()
class QuizUser with _$QuizUser {
  const factory QuizUser({
    required final String uid,
    required final String appDisplayName,
    required final String appAvatar,
    required final int appAvatarColor,
  }) = _QuizUser;

  factory QuizUser.fromJson(Map<String, Object?> json) =>
      _$QuizUserFromJson(json);
}
