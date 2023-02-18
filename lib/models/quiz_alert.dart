// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_alert.freezed.dart';
part 'quiz_alert.g.dart';

@Freezed()
class QuizAlert with _$QuizAlert {
  factory QuizAlert({
    required final String sender,
    required final String quizId,
    @Default(false) bool read,
  }) = _QuizAlert;

  factory QuizAlert.fromJson(Map<String, Object?> json) =>
      _$QuizAlertFromJson(json);
}
