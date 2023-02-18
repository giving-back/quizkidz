// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizType _$QuizTypeFromJson(Map<String, dynamic> json) {
  return _QuizType.fromJson(json);
}

/// @nodoc
mixin _$QuizType {
  String get text => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizTypeCopyWith<QuizType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizTypeCopyWith<$Res> {
  factory $QuizTypeCopyWith(QuizType value, $Res Function(QuizType) then) =
      _$QuizTypeCopyWithImpl<$Res, QuizType>;
  @useResult
  $Res call({String text, String image});
}

/// @nodoc
class _$QuizTypeCopyWithImpl<$Res, $Val extends QuizType>
    implements $QuizTypeCopyWith<$Res> {
  _$QuizTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizTypeCopyWith<$Res> implements $QuizTypeCopyWith<$Res> {
  factory _$$_QuizTypeCopyWith(
          _$_QuizType value, $Res Function(_$_QuizType) then) =
      __$$_QuizTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String image});
}

/// @nodoc
class __$$_QuizTypeCopyWithImpl<$Res>
    extends _$QuizTypeCopyWithImpl<$Res, _$_QuizType>
    implements _$$_QuizTypeCopyWith<$Res> {
  __$$_QuizTypeCopyWithImpl(
      _$_QuizType _value, $Res Function(_$_QuizType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? image = null,
  }) {
    return _then(_$_QuizType(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizType implements _QuizType {
  _$_QuizType({required this.text, required this.image});

  factory _$_QuizType.fromJson(Map<String, dynamic> json) =>
      _$$_QuizTypeFromJson(json);

  @override
  final String text;
  @override
  final String image;

  @override
  String toString() {
    return 'QuizType(text: $text, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizType &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizTypeCopyWith<_$_QuizType> get copyWith =>
      __$$_QuizTypeCopyWithImpl<_$_QuizType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizTypeToJson(
      this,
    );
  }
}

abstract class _QuizType implements QuizType {
  factory _QuizType({required final String text, required final String image}) =
      _$_QuizType;

  factory _QuizType.fromJson(Map<String, dynamic> json) = _$_QuizType.fromJson;

  @override
  String get text;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_QuizTypeCopyWith<_$_QuizType> get copyWith =>
      throw _privateConstructorUsedError;
}

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  QuizUser get quizmaster => throw _privateConstructorUsedError;
  set quizmaster(QuizUser value) => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  set subject(String value) => throw _privateConstructorUsedError;
  int get questions => throw _privateConstructorUsedError;
  set questions(int value) => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  set created(DateTime value) => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  set active(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {String id,
      QuizUser quizmaster,
      String subject,
      int questions,
      DateTime created,
      bool active});

  $QuizUserCopyWith<$Res> get quizmaster;
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizmaster = null,
    Object? subject = null,
    Object? questions = null,
    Object? created = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quizmaster: null == quizmaster
          ? _value.quizmaster
          : quizmaster // ignore: cast_nullable_to_non_nullable
              as QuizUser,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizUserCopyWith<$Res> get quizmaster {
    return $QuizUserCopyWith<$Res>(_value.quizmaster, (value) {
      return _then(_value.copyWith(quizmaster: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$_QuizCopyWith(_$_Quiz value, $Res Function(_$_Quiz) then) =
      __$$_QuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      QuizUser quizmaster,
      String subject,
      int questions,
      DateTime created,
      bool active});

  @override
  $QuizUserCopyWith<$Res> get quizmaster;
}

/// @nodoc
class __$$_QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res, _$_Quiz>
    implements _$$_QuizCopyWith<$Res> {
  __$$_QuizCopyWithImpl(_$_Quiz _value, $Res Function(_$_Quiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizmaster = null,
    Object? subject = null,
    Object? questions = null,
    Object? created = null,
    Object? active = null,
  }) {
    return _then(_$_Quiz(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quizmaster: null == quizmaster
          ? _value.quizmaster
          : quizmaster // ignore: cast_nullable_to_non_nullable
              as QuizUser,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz implements _Quiz {
  _$_Quiz(
      {this.id = '',
      required this.quizmaster,
      required this.subject,
      required this.questions,
      required this.created,
      this.active = true});

  factory _$_Quiz.fromJson(Map<String, dynamic> json) => _$$_QuizFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  QuizUser quizmaster;
  @override
  String subject;
  @override
  int questions;
  @override
  DateTime created;
  @override
  @JsonKey()
  bool active;

  @override
  String toString() {
    return 'Quiz(id: $id, quizmaster: $quizmaster, subject: $subject, questions: $questions, created: $created, active: $active)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizCopyWith<_$_Quiz> get copyWith =>
      __$$_QuizCopyWithImpl<_$_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizToJson(
      this,
    );
  }
}

abstract class _Quiz implements Quiz {
  factory _Quiz(
      {String id,
      required QuizUser quizmaster,
      required String subject,
      required int questions,
      required DateTime created,
      bool active}) = _$_Quiz;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  QuizUser get quizmaster;
  set quizmaster(QuizUser value);
  @override
  String get subject;
  set subject(String value);
  @override
  int get questions;
  set questions(int value);
  @override
  DateTime get created;
  set created(DateTime value);
  @override
  bool get active;
  set active(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_QuizCopyWith<_$_Quiz> get copyWith => throw _privateConstructorUsedError;
}
