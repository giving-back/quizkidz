// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
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

@Freezed()
class Quiz with _$Quiz {
  const factory Quiz({
    required QuizUser quizmaster,
    required String subject,
    required int questions,
    required DateTime created,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
