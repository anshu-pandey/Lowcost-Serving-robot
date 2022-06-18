import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart/CartTotal.dart';
import 'package:flutter_application_2/payment/loading_screen.dart';

import '../component/header.dart';
import 'CartProduct.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const header(text: "   CART"),
      body: SingleChildScrollView(
        child: Column(children: [
          CartTotal(),
          loading_screen(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CartProducts(),
        ]),
      ),
    );
  }
}
