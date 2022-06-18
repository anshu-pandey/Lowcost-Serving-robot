import 'package:flutter/material.dart';
import 'package:flutter_application_2/payment/order_details.dart';

import '../component/header.dart';

class order_details_main extends StatelessWidget {
  order_details_main({
    Key? key,
    required this.paymentID,
  }) : super(key: key);

  final String paymentID;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const header(text: " ORDER DETAILS"),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: order_details(paymentID: paymentID),
          ),
        ]),
      ),
    );
  }
}
