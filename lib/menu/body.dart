import 'package:flutter/material.dart';

import 'food_s.dart';
import 'monument_model.dart';

class body extends StatelessWidget {
  @override
  MonumentModel monumentModel = MonumentModel();
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

        //dish_structure(),
        // food_s(),
        food_s(monuments: monumentModel.fetchMonument())
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
