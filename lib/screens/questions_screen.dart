import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/Router/route_constants.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    //required this.onSelectAnswer,
  });

  //final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<String> _selectedAnswer = [];
  void _refresh() {
    setState(() {
      _selectedAnswer = [];
      currentQuestionIndex = 0;
    });
  }

  Widget _answerBuuton(String choices) {
    return AnswerButton(
      answerText: choices,
      onTap: () {
        answerQustion(choices);
      },
      color: 0xFF008000,
    );
  }

  void answerQustion(String selectedAnswer) {
    //widget.onSelectAnswer(selectedAnswer);
    setState(() {
      _selectedAnswer.add(selectedAnswer);
      print(_selectedAnswer);
      if (currentQuestionIndex + 1 < questions.length) {
        currentQuestionIndex++;
      } else {
        context.pushNamed(RouteConstants.result, extra: _selectedAnswer);
        //.then((value) => _refresh());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final currentChoice = questions[currentQuestionIndex].shuffledAnswers;

    return Scaffold(
      backgroundColor: const Color(0xFF1F1147),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 24, color: Color(0xFF39F1C1)),
                ),
                const SizedBox(
                  height: 30,
                ),
                ...currentChoice.map(
                  (choices) {
                    return _answerBuuton(choices);
                  },
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$currentQuestionIndex / ${questions.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    LinearProgressIndicator(
                      value: currentQuestionIndex / questions.length,
                      backgroundColor: const Color(0xFF39F1C1),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
                      borderRadius: BorderRadius.circular(20),
                      minHeight: 30,
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
