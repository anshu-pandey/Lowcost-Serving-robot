import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_2/login/login.dart';

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset("assets/logo.png"),
          nextScreen: login(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 600,
          backgroundColor: Color.fromARGB(255, 133, 26, 26),
          duration: 300,
        ));
  }
}
