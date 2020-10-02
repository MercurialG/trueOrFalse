import 'question.dart';
import 'list_of_questions.dart';
class AppBrain {

  List<Question> shuffledQuestions;

  AppBrain() {
    shuffleNumbers();
  }

  void shuffleNumbers() {
    shuffledQuestions = new List<Question>.from(questions);
    shuffledQuestions.shuffle();
  }

  nextQuestion() {
    if (shuffledQuestions.length < 1) {
      shuffleNumbers();
    }
    return shuffledQuestions.removeLast();
  }
}
