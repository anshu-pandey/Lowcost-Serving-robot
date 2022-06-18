import 'package:flutter/material.dart';
import 'package:flutter_application_2/user_info/components/body.dart';

class user_info extends StatelessWidget {
  static String routeName = "/otp";
  //@override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    return SingleChildScrollView(
      child: body(),
    );
  }
}
