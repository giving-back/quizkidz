// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return _Alert.fromJson(json);
}

/// @nodoc
mixin _$Alert {
  String get uid => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlertCopyWith<Alert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) then) =
      _$AlertCopyWithImpl<$Res, Alert>;
  @useResult
  $Res call({String uid, String message, bool read});
}

/// @nodoc
class _$AlertCopyWithImpl<$Res, $Val extends Alert>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? message = null,
    Object? read = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlertCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$$_AlertCopyWith(_$_Alert value, $Res Function(_$_Alert) then) =
      __$$_AlertCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String message, bool read});
}

/// @nodoc
class __$$_AlertCopyWithImpl<$Res> extends _$AlertCopyWithImpl<$Res, _$_Alert>
    implements _$$_AlertCopyWith<$Res> {
  __$$_AlertCopyWithImpl(_$_Alert _value, $Res Function(_$_Alert) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? message = null,
    Object? read = null,
  }) {
    return _then(_$_Alert(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Alert implements _Alert {
  _$_Alert({required this.uid, required this.message, this.read = false});

  factory _$_Alert.fromJson(Map<String, dynamic> json) =>
      _$$_AlertFromJson(json);

  @override
  final String uid;
  @override
  final String message;
  @override
  @JsonKey()
  final bool read;

  @override
  String toString() {
    return 'Alert(uid: $uid, message: $message, read: $read)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Alert &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, message, read);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlertCopyWith<_$_Alert> get copyWith =>
      __$$_AlertCopyWithImpl<_$_Alert>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlertToJson(
      this,
    );
  }
}

abstract class _Alert implements Alert {
  factory _Alert(
      {required final String uid,
      required final String message,
      final bool read}) = _$_Alert;

  factory _Alert.fromJson(Map<String, dynamic> json) = _$_Alert.fromJson;

  @override
  String get uid;
  @override
  String get message;
  @override
  bool get read;
  @override
  @JsonKey(ignore: true)
  _$$_AlertCopyWith<_$_Alert> get copyWith =>
      throw _privateConstructorUsedError;
}
