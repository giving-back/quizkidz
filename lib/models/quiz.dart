// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:quizkidz/models/user.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@Freezed()
class QuizType with _$QuizType {
  factory QuizType({
    required final String text,
    required final String image,
  }) = _QuizType;

  factory QuizType.fromJson(Map<String, Object?> json) =>
      _$QuizTypeFromJson(json);
}

@unfreezed
class Quiz with _$Quiz {
  factory Quiz({
    @Default('') String id,
    required QuizUser quizmaster,
    required String subject,
    required int questions,
    required DateTime created,
    @Default(true) bool active,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@Freezed()
class QuizAnswer with _$QuizAnswer {
  factory QuizAnswer({
    required final QuizUser player,
    required final DateTime buzzed,
  }) = _QuizAnswer;

  factory QuizAnswer.fromJson(Map<String, Object?> json) =>
      _$QuizAnswerFromJson(json);
}
