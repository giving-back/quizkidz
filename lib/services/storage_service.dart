// Package imports:
import 'package:firebase_storage/firebase_storage.dart';

// Project imports:
import 'package:quizkidz/models/quiz.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage;

  StorageService(
    this._firebaseStorage,
  );

  Future<String> getDownloadURL(String child) async =>
      _firebaseStorage.ref().child(child).getDownloadURL();

  List<QuizType> quizTypes() => [
        QuizType(text: 'Random', image: 'images/quiz/random.png'),
        QuizType(text: 'Trivia', image: 'images/quiz/trivia.png'),
        QuizType(text: 'Math', image: 'images/quiz/math.png'),
        QuizType(text: 'Space', image: 'images/quiz/space.png'),
        QuizType(text: 'Science', image: 'images/quiz/science.png'),
        QuizType(text: 'Geography', image: 'images/quiz/geography.png'),
        QuizType(text: 'Nature', image: 'images/quiz/nature.png'),
      ];

  List<int> numQuestions() => [5, 10, 15, 20, 25];
}
