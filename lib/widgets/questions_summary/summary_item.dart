import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question/answer_button.dart';
import 'package:quiz_app/widgets/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  Widget _choiceList(String choice, int color) {
    return AnswerButton(
      answerText: choice,
      onTap: () {},
      color: color,
    );
  }

  int _choiceColor(String choice) {
    if (choice == itemData['user_answer']) {
      return 0xFF0000FF;
    }
    return 0xFF008000;
  }

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer =
        itemData['correct_answer'] == itemData['user_answer'] ? true : false;
    return Column(
      children: [
        Row(
          children: [
            // QuestionIndentifier
            QuestionIdentifier(
                questionIndex: (itemData['question_index'] as int) + 1,
                isCorrectAnswer: isCorrectAnswer),

            const SizedBox(width: 20),
            Text(
              itemData['question'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // Expended ทำให้ Column กินพื้นที่ให้เยอะสุดเท่าที่ทำได้ - ลองลบออกเพื่อเทียบความต่างดูได้นะ
            // (จากที่เรียนในคลาสว่า Column กินพื้นที่บนล่างจนสุด(Height) แต่ซ้ายขวา(width)จะกว้างเท่ากับขนาด child widget)
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 5,
              ),
              ...questions[(itemData['question_index'] as int)]
                  .choices
                  .map((choice) => _choiceList(choice, _choiceColor(choice)))
            ],
          ),
        ),
      ],
    );
  }
}
