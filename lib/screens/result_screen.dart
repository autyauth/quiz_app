import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app_provider.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chooseAnswers,
  });

  final List<String> chooseAnswers;

  List<Map<String, Object>> get summaryData {
    final List<int> scores = [];
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chooseAnswers.length; i++) {
      if (chooseAnswers[i] == questions[i].choices[0]) {
        scores.add(questions[i].isScore);
      } else {
        scores.add(0);
      }
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].choices[0],
        'user_answer': chooseAnswers[i],
        'score': scores[i],
      });
    }

    return summary;
  }

  int get totalScore {
    int total = 0;
    for (int i = 0; i < summaryData.length; i++) {
      total += summaryData[i]['score'] as int;
    }
    return total;
  }

  int get totalScoreQuestion {
    int total = 0;
    for (int i = 0; i < questions.length; i++) {
      total += questions[i].isScore;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQustions = questions.length;
    final numCorrectQuestion = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;
    final nameProvider = context.read<AppProvider>().name;
    return Scaffold(
      backgroundColor: const Color(0xFF1F1147),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                '$nameProvider ตอบถูกทั้งหมด $numCorrectQuestion ข้อ จาก $numTotalQustions ข้อ',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '$nameProvider ได้คะแนน $totalScore คะแนน เต็ม $totalScoreQuestion คะแนน ',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              QuestionSummary(summaryData),
              TextButton.icon(
                onPressed: (() {
                  context
                    //..pop()
                    ..pop()
                    ..pop();
                }),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
