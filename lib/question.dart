class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
@override
  String toString() {
    // TODO: implement toString
    return questionText;
  }
}