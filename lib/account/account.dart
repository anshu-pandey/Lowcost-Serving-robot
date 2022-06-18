import 'package:flutter/material.dart';
import 'package:flutter_application_2/account/component/body.dart';
import 'package:flutter_application_2/component/header.dart';
import 'package:flutter_application_2/payment/loading_screen.dart';

class account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(text: "ACCOUNT"),
      body: body(),
    );
  }
}
