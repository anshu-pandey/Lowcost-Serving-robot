import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class spalsh extends StatelessWidget {
  List<Widget> getPages() {
    return [
      Image.asset(
        "assets/onboarding_3.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
      Image.asset(
        "assets/onboarding_1.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
      Image.asset(
        "assets/onboarding_2.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
      Image.asset(
        "assets/onboarding_4.png",
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionScreen(
        showDoneButton: false,
        showNextButton: false,
        rawPages: getPages(),
        animationDuration: 2,
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Color.fromARGB(255, 167, 25, 20),
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            activeColor: Color.fromARGB(255, 0, 0, 0)),
        globalBackgroundColor: Color.fromARGB(255, 247, 245, 245),
      ),
    );
  }
}
