// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizAlert _$$_QuizAlertFromJson(Map<String, dynamic> json) => _$_QuizAlert(
      sender: json['sender'] as String,
      quizId: json['quizId'] as String,
      read: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QuizAlertToJson(_$_QuizAlert instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'quizId': instance.quizId,
      'read': instance.read,
    };
