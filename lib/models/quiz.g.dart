// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizType _$$_QuizTypeFromJson(Map<String, dynamic> json) => _$_QuizType(
      text: json['text'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_QuizTypeToJson(_$_QuizType instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      id: json['id'] as String? ?? '',
      quizmaster: QuizUser.fromJson(json['quizmaster'] as Map<String, dynamic>),
      created: DateTime.parse(json['created'] as String),
      currentQuestionNumber: json['currentQuestionNumber'] as int? ?? 1,
      active: json['active'] as bool? ?? true,
      winner: json['winner'] == null
          ? const QuizPlayer(
              player: QuizUser(
                  uid: '',
                  appDisplayName: '',
                  appAvatar: '',
                  appAvatarColor: 0))
          : QuizPlayer.fromJson(json['winner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'quizmaster': instance.quizmaster.toJson(),
      'created': instance.created.toIso8601String(),
      'currentQuestionNumber': instance.currentQuestionNumber,
      'active': instance.active,
      'winner': instance.winner.toJson(),
    };

_$_QuizAnswer _$$_QuizAnswerFromJson(Map<String, dynamic> json) =>
    _$_QuizAnswer(
      player: QuizUser.fromJson(json['player'] as Map<String, dynamic>),
      buzzed: DateTime.parse(json['buzzed'] as String),
    );

Map<String, dynamic> _$$_QuizAnswerToJson(_$_QuizAnswer instance) =>
    <String, dynamic>{
      'player': instance.player.toJson(),
      'buzzed': instance.buzzed.toIso8601String(),
    };

_$_QuizQuestion _$$_QuizQuestionFromJson(Map<String, dynamic> json) =>
    _$_QuizQuestion(
      q: json['q'] as String,
      a: json['a'] as String,
    );

Map<String, dynamic> _$$_QuizQuestionToJson(_$_QuizQuestion instance) =>
    <String, dynamic>{
      'q': instance.q,
      'a': instance.a,
    };
