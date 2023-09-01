import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/Router/route_constants.dart';
import 'package:quiz_app/screens/questions_screen.dart';

import 'package:quiz_app/widgets/start_widget/start_fill_part.dart';
import 'package:quiz_app/widgets/start_widget/start_topStack.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1F1147),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const StartTopStack(),
          const SizedBox(
            height: 100,
          ),
          StartFill(
            onPlay: () {
              context
                  .pushNamed(
                    RouteConstants.question,
                  )
                  .then((value) => textcontroller.clear());
            },
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
