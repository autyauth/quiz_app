import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/screens/questions_screen.dart';

import 'package:quiz_app/widgets/start_widget/start_fill_part.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final TextEditingController textcontroller = TextEditingController();
  @override
  void dispose() {
    textcontroller.dispose(); // Release the TextEditingController's resources.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _pressPlay() {
      Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QuestionsScreen()))
          .then((value) => textcontroller.clear());
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1F1147),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              SvgPicture.asset(
                'assets/svg/Vector1.svg',
                width: MediaQuery.of(context).size.width,
              ),
              SvgPicture.asset(
                'assets/svg/Group3.svg',
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    'assets/images/light_bulb.png',
                    width: 200,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Dahoop!',
                    style: TextStyle(fontSize: 60, color: Color(0xFF39F1C1)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          StartFill(
            onPlay: _pressPlay,
            textController: textcontroller,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
          ),
        ]),
      ),
    );
  }
}
