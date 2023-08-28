class QuizQuestion {
  const QuizQuestion(this.text, this.choices, this.score);

  final String text;
  final List<String> choices;
  final int score;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(choices);
    shuffledList.shuffle();
    return shuffledList;
  }
}
