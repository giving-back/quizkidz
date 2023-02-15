// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      uid: json['uid'] as String,
      email: json['email'] as String?,
      authDisplayName: json['authDisplayName'] as String?,
      authPhotoURL: json['authPhotoURL'] as String?,
      firstTimeUser: json['firstTimeUser'] as bool? ?? true,
      appDisplayName: json['appDisplayName'] as String? ?? '',
      appAvatar: json['appAvatar'] as String? ?? '',
      appAvatarColor: json['appAvatarColor'] as int? ?? 1,
      quizWins: json['quizWins'] as int? ?? 0,
      questionsAnswered: json['questionsAnswered'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'authDisplayName': instance.authDisplayName,
      'authPhotoURL': instance.authPhotoURL,
      'firstTimeUser': instance.firstTimeUser,
      'appDisplayName': instance.appDisplayName,
      'appAvatar': instance.appAvatar,
      'appAvatarColor': instance.appAvatarColor,
      'quizWins': instance.quizWins,
      'questionsAnswered': instance.questionsAnswered,
    };

_$_QuizUser _$$_QuizUserFromJson(Map<String, dynamic> json) => _$_QuizUser(
      uid: json['uid'] as String,
      appDisplayName: json['appDisplayName'] as String,
      appAvatar: json['appAvatar'] as String,
      appAvatarColor: json['appAvatarColor'] as int,
    );

Map<String, dynamic> _$$_QuizUserToJson(_$_QuizUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'appDisplayName': instance.appDisplayName,
      'appAvatar': instance.appAvatar,
      'appAvatarColor': instance.appAvatarColor,
    };

_$_Friend _$$_FriendFromJson(Map<String, dynamic> json) => _$_Friend(
      details: AppUser.fromJson(json['details'] as Map<String, dynamic>),
      iRequested: json['iRequested'] as bool,
      matched: json['matched'] as bool,
      requested: DateTime.parse(json['requested'] as String),
      matchedOn: DateTime.parse(json['matchedOn'] as String),
    );

Map<String, dynamic> _$$_FriendToJson(_$_Friend instance) => <String, dynamic>{
      'details': instance.details.toJson(),
      'iRequested': instance.iRequested,
      'matched': instance.matched,
      'requested': instance.requested.toIso8601String(),
      'matchedOn': instance.matchedOn.toIso8601String(),
    };
