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
    @Default('')
        String id,
    required QuizUser quizmaster,
    required DateTime created,
    @Default(1)
        int currentQuestionNumber,
    @Default(true)
        bool active,
    @Default(QuizPlayer(
        player: QuizUser(
      uid: '',
      appDisplayName: '',
      appAvatar: '',
      appAvatarColor: 0,
    )))
        QuizPlayer winner,
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

@Freezed()
class QuizQuestion with _$QuizQuestion {
  factory QuizQuestion({
    required final String q,
    required final String a,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, Object?> json) =>
      _$QuizQuestionFromJson(json);
}
