import 'package:flutter/material.dart';
import 'package:flutter_application_2/homepage/components/clickImage.dart';
import 'package:flutter_application_2/homepage/components/splash.dart';

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: spalsh(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.30,
        ),
        SizedBox(
          height: 20,
        ),
        larger_case("BROWSE CATEGORIES --------- "),
        clickImage(),
        //   footer(),
      ]),
    );
  }

  Text small_case(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            decoration: TextDecoration.none));
  }

  Text larger_case(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            decoration: TextDecoration.none));
  }
}
