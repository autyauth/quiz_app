import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrectAnswer});

  final int questionIndex;
  final bool isCorrectAnswer;

  Widget _setColor(bool isCorrect) {
    if (isCorrect) {
      return Container(
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.green)),
        child: Text(questionIndex.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      );
    }
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
      child: Text(questionIndex.toString(),
          style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _setColor(isCorrectAnswer);
  }
}
