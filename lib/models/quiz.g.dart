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
      subject: json['subject'] as String,
      questions: json['questions'] as int,
      created: DateTime.parse(json['created'] as String),
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'quizmaster': instance.quizmaster.toJson(),
      'subject': instance.subject,
      'questions': instance.questions,
      'created': instance.created.toIso8601String(),
      'active': instance.active,
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
