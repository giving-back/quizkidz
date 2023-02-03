import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

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
