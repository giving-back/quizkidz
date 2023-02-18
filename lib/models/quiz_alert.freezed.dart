// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizAlert _$QuizAlertFromJson(Map<String, dynamic> json) {
  return _QuizAlert.fromJson(json);
}

/// @nodoc
mixin _$QuizAlert {
  String get uid => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  String get quizId => throw _privateConstructorUsedError;
  DateTime get raised => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizAlertCopyWith<QuizAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAlertCopyWith<$Res> {
  factory $QuizAlertCopyWith(QuizAlert value, $Res Function(QuizAlert) then) =
      _$QuizAlertCopyWithImpl<$Res, QuizAlert>;
  @useResult
  $Res call(
      {String uid, String sender, String quizId, DateTime raised, bool read});
}

/// @nodoc
class _$QuizAlertCopyWithImpl<$Res, $Val extends QuizAlert>
    implements $QuizAlertCopyWith<$Res> {
  _$QuizAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? sender = null,
    Object? quizId = null,
    Object? raised = null,
    Object? read = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      raised: null == raised
          ? _value.raised
          : raised // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizAlertCopyWith<$Res> implements $QuizAlertCopyWith<$Res> {
  factory _$$_QuizAlertCopyWith(
          _$_QuizAlert value, $Res Function(_$_QuizAlert) then) =
      __$$_QuizAlertCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid, String sender, String quizId, DateTime raised, bool read});
}

/// @nodoc
class __$$_QuizAlertCopyWithImpl<$Res>
    extends _$QuizAlertCopyWithImpl<$Res, _$_QuizAlert>
    implements _$$_QuizAlertCopyWith<$Res> {
  __$$_QuizAlertCopyWithImpl(
      _$_QuizAlert _value, $Res Function(_$_QuizAlert) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? sender = null,
    Object? quizId = null,
    Object? raised = null,
    Object? read = null,
  }) {
    return _then(_$_QuizAlert(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      raised: null == raised
          ? _value.raised
          : raised // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizAlert implements _QuizAlert {
  _$_QuizAlert(
      {required this.uid,
      required this.sender,
      required this.quizId,
      required this.raised,
      this.read = false});

  factory _$_QuizAlert.fromJson(Map<String, dynamic> json) =>
      _$$_QuizAlertFromJson(json);

  @override
  final String uid;
  @override
  final String sender;
  @override
  final String quizId;
  @override
  final DateTime raised;
  @override
  @JsonKey()
  final bool read;

  @override
  String toString() {
    return 'QuizAlert(uid: $uid, sender: $sender, quizId: $quizId, raised: $raised, read: $read)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizAlert &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.raised, raised) || other.raised == raised) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, sender, quizId, raised, read);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizAlertCopyWith<_$_QuizAlert> get copyWith =>
      __$$_QuizAlertCopyWithImpl<_$_QuizAlert>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizAlertToJson(
      this,
    );
  }
}

abstract class _QuizAlert implements QuizAlert {
  factory _QuizAlert(
      {required final String uid,
      required final String sender,
      required final String quizId,
      required final DateTime raised,
      final bool read}) = _$_QuizAlert;

  factory _QuizAlert.fromJson(Map<String, dynamic> json) =
      _$_QuizAlert.fromJson;

  @override
  String get uid;
  @override
  String get sender;
  @override
  String get quizId;
  @override
  DateTime get raised;
  @override
  bool get read;
  @override
  @JsonKey(ignore: true)
  _$$_QuizAlertCopyWith<_$_QuizAlert> get copyWith =>
      throw _privateConstructorUsedError;
}
