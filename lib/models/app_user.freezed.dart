// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get authDisplayName => throw _privateConstructorUsedError;
  String? get authPhotoURL => throw _privateConstructorUsedError;
  String? get appDisplayName => throw _privateConstructorUsedError;
  set appDisplayName(String? value) => throw _privateConstructorUsedError;
  String? get appAvatar => throw _privateConstructorUsedError;
  set appAvatar(String? value) => throw _privateConstructorUsedError;
  int? get appAvatarColor => throw _privateConstructorUsedError;
  set appAvatarColor(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String uid,
      String? email,
      String? authDisplayName,
      String? authPhotoURL,
      String? appDisplayName,
      String? appAvatar,
      int? appAvatarColor});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = freezed,
    Object? authDisplayName = freezed,
    Object? authPhotoURL = freezed,
    Object? appDisplayName = freezed,
    Object? appAvatar = freezed,
    Object? appAvatarColor = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authDisplayName: freezed == authDisplayName
          ? _value.authDisplayName
          : authDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      authPhotoURL: freezed == authPhotoURL
          ? _value.authPhotoURL
          : authPhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      appDisplayName: freezed == appDisplayName
          ? _value.appDisplayName
          : appDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      appAvatar: freezed == appAvatar
          ? _value.appAvatar
          : appAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      appAvatarColor: freezed == appAvatarColor
          ? _value.appAvatarColor
          : appAvatarColor // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? email,
      String? authDisplayName,
      String? authPhotoURL,
      String? appDisplayName,
      String? appAvatar,
      int? appAvatarColor});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = freezed,
    Object? authDisplayName = freezed,
    Object? authPhotoURL = freezed,
    Object? appDisplayName = freezed,
    Object? appAvatar = freezed,
    Object? appAvatarColor = freezed,
  }) {
    return _then(_$_AppUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authDisplayName: freezed == authDisplayName
          ? _value.authDisplayName
          : authDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      authPhotoURL: freezed == authPhotoURL
          ? _value.authPhotoURL
          : authPhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      appDisplayName: freezed == appDisplayName
          ? _value.appDisplayName
          : appDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      appAvatar: freezed == appAvatar
          ? _value.appAvatar
          : appAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      appAvatarColor: freezed == appAvatarColor
          ? _value.appAvatarColor
          : appAvatarColor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  _$_AppUser(
      {required this.uid,
      required this.email,
      required this.authDisplayName,
      required this.authPhotoURL,
      this.appDisplayName = '',
      this.appAvatar = '',
      this.appAvatarColor = 1});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String uid;
  @override
  final String? email;
  @override
  final String? authDisplayName;
  @override
  final String? authPhotoURL;
  @override
  @JsonKey()
  String? appDisplayName;
  @override
  @JsonKey()
  String? appAvatar;
  @override
  @JsonKey()
  int? appAvatarColor;

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, authDisplayName: $authDisplayName, authPhotoURL: $authPhotoURL, appDisplayName: $appDisplayName, appAvatar: $appAvatar, appAvatarColor: $appAvatarColor)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {required final String uid,
      required final String? email,
      required final String? authDisplayName,
      required final String? authPhotoURL,
      String? appDisplayName,
      String? appAvatar,
      int? appAvatarColor}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get uid;
  @override
  String? get email;
  @override
  String? get authDisplayName;
  @override
  String? get authPhotoURL;
  @override
  String? get appDisplayName;
  set appDisplayName(String? value);
  @override
  String? get appAvatar;
  set appAvatar(String? value);
  @override
  int? get appAvatarColor;
  set appAvatarColor(int? value);
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
