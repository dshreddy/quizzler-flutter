class Questions {
  String question = "";
  bool answer = false;

  Questions(String questionText, bool questionAnswer) {
    question = questionText;
    answer = questionAnswer;
  }
}

List<Questions> questions = [
  Questions('You can lead a cow down stairs but not up stairs.', false),
  Questions('You can lead a cow down stairs but not up stairs.', true),
  Questions('A slug\'s blood is green.', true),
];
