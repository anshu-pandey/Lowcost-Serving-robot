import 'package:flutter/material.dart';
import 'package:flutter_application_2/component/header.dart';
import 'package:flutter_application_2/login/component/body.dart';

class login extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        header(text: "Welcome to Foronic Alchemist"),
        body(),
      ]),
    );
  }
}
