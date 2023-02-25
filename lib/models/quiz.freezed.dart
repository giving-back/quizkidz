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
  DateTime get created => throw _privateConstructorUsedError;
  set created(DateTime value) => throw _privateConstructorUsedError;
  int get currentQuestionNumber => throw _privateConstructorUsedError;
  set currentQuestionNumber(int value) => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  set active(bool value) => throw _privateConstructorUsedError;
  QuizPlayer get winner => throw _privateConstructorUsedError;
  set winner(QuizPlayer value) => throw _privateConstructorUsedError;

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
      DateTime created,
      int currentQuestionNumber,
      bool active,
      QuizPlayer winner});

  $QuizUserCopyWith<$Res> get quizmaster;
  $QuizPlayerCopyWith<$Res> get winner;
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
    Object? created = null,
    Object? currentQuestionNumber = null,
    Object? active = null,
    Object? winner = null,
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
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentQuestionNumber: null == currentQuestionNumber
          ? _value.currentQuestionNumber
          : currentQuestionNumber // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      winner: null == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as QuizPlayer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizUserCopyWith<$Res> get quizmaster {
    return $QuizUserCopyWith<$Res>(_value.quizmaster, (value) {
      return _then(_value.copyWith(quizmaster: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizPlayerCopyWith<$Res> get winner {
    return $QuizPlayerCopyWith<$Res>(_value.winner, (value) {
      return _then(_value.copyWith(winner: value) as $Val);
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
      DateTime created,
      int currentQuestionNumber,
      bool active,
      QuizPlayer winner});

  @override
  $QuizUserCopyWith<$Res> get quizmaster;
  @override
  $QuizPlayerCopyWith<$Res> get winner;
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
    Object? created = null,
    Object? currentQuestionNumber = null,
    Object? active = null,
    Object? winner = null,
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
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentQuestionNumber: null == currentQuestionNumber
          ? _value.currentQuestionNumber
          : currentQuestionNumber // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      winner: null == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as QuizPlayer,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz implements _Quiz {
  _$_Quiz(
      {this.id = '',
      required this.quizmaster,
      required this.created,
      this.currentQuestionNumber = 1,
      this.active = true,
      this.winner = const QuizPlayer(
          player: QuizUser(
              uid: '', appDisplayName: '', appAvatar: '', appAvatarColor: 0))});

  factory _$_Quiz.fromJson(Map<String, dynamic> json) => _$$_QuizFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  QuizUser quizmaster;
  @override
  DateTime created;
  @override
  @JsonKey()
  int currentQuestionNumber;
  @override
  @JsonKey()
  bool active;
  @override
  @JsonKey()
  QuizPlayer winner;

  @override
  String toString() {
    return 'Quiz(id: $id, quizmaster: $quizmaster, created: $created, currentQuestionNumber: $currentQuestionNumber, active: $active, winner: $winner)';
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
      required DateTime created,
      int currentQuestionNumber,
      bool active,
      QuizPlayer winner}) = _$_Quiz;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  QuizUser get quizmaster;
  set quizmaster(QuizUser value);
  @override
  DateTime get created;
  set created(DateTime value);
  @override
  int get currentQuestionNumber;
  set currentQuestionNumber(int value);
  @override
  bool get active;
  set active(bool value);
  @override
  QuizPlayer get winner;
  set winner(QuizPlayer value);
  @override
  @JsonKey(ignore: true)
  _$$_QuizCopyWith<_$_Quiz> get copyWith => throw _privateConstructorUsedError;
}

QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) {
  return _QuizAnswer.fromJson(json);
}

/// @nodoc
mixin _$QuizAnswer {
  QuizUser get player => throw _privateConstructorUsedError;
  DateTime get buzzed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizAnswerCopyWith<QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerCopyWith<$Res> {
  factory $QuizAnswerCopyWith(
          QuizAnswer value, $Res Function(QuizAnswer) then) =
      _$QuizAnswerCopyWithImpl<$Res, QuizAnswer>;
  @useResult
  $Res call({QuizUser player, DateTime buzzed});

  $QuizUserCopyWith<$Res> get player;
}

/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res, $Val extends QuizAnswer>
    implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? buzzed = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as QuizUser,
      buzzed: null == buzzed
          ? _value.buzzed
          : buzzed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizUserCopyWith<$Res> get player {
    return $QuizUserCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizAnswerCopyWith<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  factory _$$_QuizAnswerCopyWith(
          _$_QuizAnswer value, $Res Function(_$_QuizAnswer) then) =
      __$$_QuizAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QuizUser player, DateTime buzzed});

  @override
  $QuizUserCopyWith<$Res> get player;
}

/// @nodoc
class __$$_QuizAnswerCopyWithImpl<$Res>
    extends _$QuizAnswerCopyWithImpl<$Res, _$_QuizAnswer>
    implements _$$_QuizAnswerCopyWith<$Res> {
  __$$_QuizAnswerCopyWithImpl(
      _$_QuizAnswer _value, $Res Function(_$_QuizAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? buzzed = null,
  }) {
    return _then(_$_QuizAnswer(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as QuizUser,
      buzzed: null == buzzed
          ? _value.buzzed
          : buzzed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizAnswer implements _QuizAnswer {
  _$_QuizAnswer({required this.player, required this.buzzed});

  factory _$_QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_QuizAnswerFromJson(json);

  @override
  final QuizUser player;
  @override
  final DateTime buzzed;

  @override
  String toString() {
    return 'QuizAnswer(player: $player, buzzed: $buzzed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizAnswer &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.buzzed, buzzed) || other.buzzed == buzzed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player, buzzed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizAnswerCopyWith<_$_QuizAnswer> get copyWith =>
      __$$_QuizAnswerCopyWithImpl<_$_QuizAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizAnswerToJson(
      this,
    );
  }
}

abstract class _QuizAnswer implements QuizAnswer {
  factory _QuizAnswer(
      {required final QuizUser player,
      required final DateTime buzzed}) = _$_QuizAnswer;

  factory _QuizAnswer.fromJson(Map<String, dynamic> json) =
      _$_QuizAnswer.fromJson;

  @override
  QuizUser get player;
  @override
  DateTime get buzzed;
  @override
  @JsonKey(ignore: true)
  _$$_QuizAnswerCopyWith<_$_QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  String get q => throw _privateConstructorUsedError;
  String get a => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) then) =
      _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call({String q, String a});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? a = null,
  }) {
    return _then(_value.copyWith(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizQuestionCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$_QuizQuestionCopyWith(
          _$_QuizQuestion value, $Res Function(_$_QuizQuestion) then) =
      __$$_QuizQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String q, String a});
}

/// @nodoc
class __$$_QuizQuestionCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$_QuizQuestion>
    implements _$$_QuizQuestionCopyWith<$Res> {
  __$$_QuizQuestionCopyWithImpl(
      _$_QuizQuestion _value, $Res Function(_$_QuizQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? a = null,
  }) {
    return _then(_$_QuizQuestion(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizQuestion implements _QuizQuestion {
  _$_QuizQuestion({required this.q, required this.a});

  factory _$_QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_QuizQuestionFromJson(json);

  @override
  final String q;
  @override
  final String a;

  @override
  String toString() {
    return 'QuizQuestion(q: $q, a: $a)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizQuestion &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.a, a) || other.a == a));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, q, a);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizQuestionCopyWith<_$_QuizQuestion> get copyWith =>
      __$$_QuizQuestionCopyWithImpl<_$_QuizQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizQuestionToJson(
      this,
    );
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  factory _QuizQuestion({required final String q, required final String a}) =
      _$_QuizQuestion;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$_QuizQuestion.fromJson;

  @override
  String get q;
  @override
  String get a;
  @override
  @JsonKey(ignore: true)
  _$$_QuizQuestionCopyWith<_$_QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
