import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                small_case(
                  "Subtotal",
                ),
                small_case(
                  "Rs. " + '${controller.total}',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                small_case(
                  "GST",
                ),
                small_case(
                  "Rs. " + (controller.total * 0.18).toString(),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                small_case(
                  "TOTAL",
                ),
                small_case(
                  "Rs." +
                      (controller.total + controller.total * 0.18).toString(),
                ),
              ],
            ),
          ]),
        ],
      )),
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
          fontSize: 15,
          decoration: TextDecoration.none));
}
