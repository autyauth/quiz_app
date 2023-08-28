import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartTopStack extends StatelessWidget {
  const StartTopStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            const SizedBox(height: 70),
            Image.asset(
              'assets/images/light_bulb.png',
              width: 200,
            ),
            const SizedBox(height: 50),
            const Text(
              'Dahoop!',
              style: TextStyle(fontSize: 60, color: Color(0xFF39F1C1)),
            ),
          ],
        ),
      ],
    );
  }
}
