import 'package:flutter/material.dart';
import 'package:flutter_application_2/payment/loading_screen.dart';
import 'package:flutter_application_2/payment/order_details.dart';
import 'package:flutter_application_2/user_info/components/body.dart'
    as user_info;

import 'package:flutter_application_2/login/component/body.dart' as log;

import '../feedback/feedback.dart';
import 'order_details_main.dart';

class success_page extends StatelessWidget {
  success_page({
    Key? key,
    required this.paymentID,
  }) : super(key: key);

  final String paymentID;
  get payment_id => paymentID;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Image.asset(
          "assets/bulb.png",
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        small_case("ORDER PLACED SUCCESSFULLY"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        small_case(
          "Your'r order is getting ready",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        small_case(
          "Payment Details".toUpperCase(),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  small_case("Name:"),
                  small_case(user_info.body.name_c.text),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  small_case("Phone No:"),
                  small_case(log.body.phoneController.text),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  small_case("Payment ID:"),
                  small_case(paymentID),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton(
                child: small_case_white("See order details".toUpperCase()),
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => order_details_main(
                            paymentID: paymentID,
                          ));
                  Navigator.push(context, route);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 80, 27, 27),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton(
                child: small_case_white("Feedback Form".toUpperCase()),
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => feedback());
                  Navigator.push(context, route);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 80, 27, 27),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 120, 11, 37))),
          height: MediaQuery.of(context).size.height * 0.35,
        ),
      ]),
      color: Colors.white,
    );
  }
}

Text small_case(String text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          decoration: TextDecoration.none));
}

Text small_case_white(String text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          decoration: TextDecoration.none));
}
