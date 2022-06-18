import 'package:flutter/material.dart';
import 'package:flutter_application_2/component/header.dart';
import 'package:flutter_application_2/homepage/components/body.dart';
import 'package:flutter_application_2/user_info/components/body.dart'
    as user_info;

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: header(text: "Welcome " + user_info.body.name_c.text),
      body: body(),
    );
  }
}
