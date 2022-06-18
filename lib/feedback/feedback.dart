import 'package:flutter/material.dart';
import 'package:flutter_application_2/feedback/body.dart';

class feedback extends StatelessWidget {
  static String routeName = "/otp";
  //@override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    return SingleChildScrollView(
      child: body(),
    );
  }
}
