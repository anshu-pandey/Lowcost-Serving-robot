import 'package:flutter/material.dart';
import 'package:flutter_application_2/menu/food_s.dart';
import 'package:flutter_application_2/menu/body.dart';
import 'package:flutter_application_2/component/header.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const header(text: "   MENU"),
      body: body(),
    );
  }
}
