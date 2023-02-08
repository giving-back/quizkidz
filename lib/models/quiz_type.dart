// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_type.freezed.dart';
part 'quiz_type.g.dart';

@freezed
class QuizType with _$QuizType {
  factory QuizType({
    required final String text,
    required final String image,
  }) = _QuizType;

  factory QuizType.fromJson(Map<String, Object?> json) =>
      _$QuizTypeFromJson(json);
}

final kQuizTypeImages = [
  QuizType(text: 'Random', image: 'lib/images/quiz/random.png'),
  QuizType(text: 'Trivia', image: 'lib/images/quiz/trivia.png'),
  QuizType(text: 'Math', image: 'lib/images/quiz/math.png'),
  QuizType(text: 'Space', image: 'lib/images/quiz/space.png'),
  QuizType(text: 'Science', image: 'lib/images/quiz/science.png'),
  QuizType(text: 'Geography', image: 'lib/images/quiz/geography.png'),
  QuizType(text: 'Nature', image: 'lib/images/quiz/nature.png'),
];
