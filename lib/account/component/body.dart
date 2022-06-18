import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/orderdata_field.dart';
import 'package:flutter_application_2/OTP/otp.dart';
import 'package:flutter_application_2/component/header.dart';
import 'package:flutter_application_2/login/component/body.dart' as log;
import 'package:flutter_application_2/user_info/components/body.dart'
    as user_info;
import 'package:flutter_application_2/login/login.dart';
import 'package:flutter_application_2/OTP/component/body.dart' as ot;

import '../../payment/success_page.dart';

class body extends StatefulWidget {
  _body createState() {
    return new _body();
  }
}

class _body extends State<body> {
  bool _isEnable = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.02,
      ),
      Icon(
        Icons.supervised_user_circle,
        color: Color.fromARGB(255, 90, 22, 22),
        size: 60,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.02,
      ),
      larger_case("Hello " + user_info.body.name_c.text + "!"),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.02,
      ),
      small_case(log.body.phoneController.text),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Row(children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: table(),
        ),
        SizedBox(
          width: 3,
        ),
        IconButton(
            // alignment: Alignment.bottomRight,
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEnable = true;
              });
            }),
      ]),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.1,
      ),
      if (_isEnable == true)
        ElevatedButton(
            child: Text("Done"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 90, 30, 30),
            ),
            onPressed: () {
              setState(() {
                _isEnable = false;
              });
            }),
      previous_order(
        "Current Order",
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.1,
      ),
      sign_out("Sign Out"),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
      ),
    ]));
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

  TextFormField table() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: user_info.body.table_c,
      enabled: _isEnable,
      decoration: const InputDecoration(
        labelText: "Table No",
        labelStyle: TextStyle(color: Color.fromARGB(255, 90, 30, 30)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.table_chart_outlined,
          color: Color.fromARGB(255, 80, 27, 27),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 90, 30, 30), width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 90, 30, 30), width: 2.0),
        ),
      ),
    );
  }

  ElevatedButton sign_out(String text) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () {
        //if
        //Route route = MaterialPageRoute(builder: (context) => otp());
        //Navigator.push(context, route);
        log.body.auth.signOut().then((value) => Navigator.of(context)
            .pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => login()),
                (route) => false));

        log.body.phoneController.clear();
        ot.body.otpController.clear();
        user_info.body.name_c.clear();
        user_info.body.age_c.clear();
        user_info.body.adult_c.clear();
        user_info.body.child_c.clear();
        user_info.body.table_c.clear();
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 80, 27, 27),
      ),
    );
  }

  previous_order(String s) {
    return ElevatedButton(
      child: Text(s),
      onPressed: () {
        Route route = MaterialPageRoute(
            builder: (context) => success_page(
                  paymentID: orderdata_filed.PaymentID,
                ));

        Navigator.push(context, route);
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 80, 27, 27),
      ),
    );
  }
}
