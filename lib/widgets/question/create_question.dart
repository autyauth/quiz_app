import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CreateQuestionScreen extends StatefulWidget {
  const CreateQuestionScreen({super.key, required this.onQuestionCreated});

  //final Function(String question, List<String> answers, int score) onQuestionCreated;
  final Function(QuizQuestion) onQuestionCreated;
  @override
  State<CreateQuestionScreen> createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController choicesController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();

  final List<String> choices = [];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('create question'),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6848FE),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Create a question'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: questionController,
                        decoration: const InputDecoration(
                          labelText: 'Question',
                        ),
                        validator: RequiredValidator(
                          errorText: 'Question is required',
                        ),
                      ),
                      TextFormField(
                        controller: choicesController,
                        decoration: const InputDecoration(
                          labelText: 'Choices (separated by commas)',
                        ),
                        validator: RequiredValidator(
                          errorText: 'Choices is required',
                        ),
                      ),
                      TextFormField(
                        controller: scoreController,
                        decoration: const InputDecoration(
                          labelText: 'Score',
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'Score is required',
                          ),
                          RangeValidator(
                            min: 1,
                            max: 10,
                            errorText: 'Score must be between 1 and 10',
                          ),
                        ]),
                      ),
                      ElevatedButton(
                        child: const Text('Add'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final question = questionController.text;
                            final choicesText = choicesController.text;
                            final scoreText = scoreController.text;
                            final score = int.tryParse(scoreText) ?? 0;
                            final choices = choicesText
                                .split(',')
                                .map((e) => e.trim())
                                .toList();
                            final quizQuestion =
                                QuizQuestion(question, choices, score);
                            widget.onQuestionCreated(quizQuestion);
                            questionController.clear();
                            choicesController.clear();
                            scoreController.clear();
                            context.pop();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
