// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_alert.freezed.dart';
part 'quiz_alert.g.dart';

@Freezed()
class QuizAlert with _$QuizAlert {
  factory QuizAlert({
    required final String receiverId,
    required final String senderId,
    required final String senderName,
    required final String quizId,
    required final DateTime raised,
    @Default(false) bool read,
  }) = _QuizAlert;

  factory QuizAlert.fromJson(Map<String, Object?> json) =>
      _$QuizAlertFromJson(json);
}
