// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      uid: json['uid'] as String,
      email: json['email'] as String?,
      authDisplayName: json['authDisplayName'] as String?,
      authPhotoURL: json['authPhotoURL'] as String?,
      appDisplayName: json['appDisplayName'] as String? ?? '',
      appAvatar: json['appAvatar'] as String? ?? '',
      appAvatarColor: json['appAvatarColor'] as int? ?? 1,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'authDisplayName': instance.authDisplayName,
      'authPhotoURL': instance.authPhotoURL,
      'appDisplayName': instance.appDisplayName,
      'appAvatar': instance.appAvatar,
      'appAvatarColor': instance.appAvatarColor,
    };