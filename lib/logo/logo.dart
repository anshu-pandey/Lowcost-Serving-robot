import 'package:flutter/material.dart';
import 'package:flutter_application_2/logo/body.dart';

class logo extends StatelessWidget {
  static String routeName = "/logo";
  //@override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    return Scaffold(
      body: body(),
    );
  }
}
