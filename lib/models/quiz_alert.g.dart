// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizAlert _$$_QuizAlertFromJson(Map<String, dynamic> json) => _$_QuizAlert(
      receiverId: json['receiverId'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      quizId: json['quizId'] as String,
      raised: DateTime.parse(json['raised'] as String),
      read: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QuizAlertToJson(_$_QuizAlert instance) =>
    <String, dynamic>{
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'quizId': instance.quizId,
      'raised': instance.raised.toIso8601String(),
      'read': instance.read,
    };
