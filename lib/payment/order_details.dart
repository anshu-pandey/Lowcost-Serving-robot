import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart/cart_controller.dart';
import 'package:flutter_application_2/payment/success_page.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/menu/monument_model.dart';

import 'package:flutter/material.dart';

class order_details extends StatelessWidget {
  order_details({
    Key? key,
    required this.paymentID,
  }) : super(key: key);

  final CartController controller = Get.find();
  final String paymentID;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.product.length,
        itemBuilder: (BuildContext context, int index) {
          return CartProductsCard(
            controller: controller,
            product: controller.product.keys.toList()[index],
            quantity: controller.product.values.toList()[index],
            index: index,
            paymentID: paymentID,
          );
        });
  }
}

class CartProductsCard extends StatelessWidget {
  final CartController controller;
  final MonumentModel product;
  final int quantity;
  final int index;
  final String paymentID;
  const CartProductsCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.index,
      required this.quantity,
      required this.paymentID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(
        color: Color.fromARGB(255, 73, 11, 11),
        height: 25,
        thickness: 1,
        indent: 5,
        endIndent: 5,
      ),
      InkWell(
        child: Container(
          //  decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          //    height: MediaQuery.of(context).size.height * 0.5,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.59,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.food_name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Row(children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.10),
                        Expanded(
                          child: Text(
                            product.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            //    softWrap: false,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 110, 110, 110),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.10),
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "\Rs." + product.price.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Row(children: [
                              Text(
                                product.veg_non_veg,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Icon(
                                Icons.circle,
                                color: product.veg_non_veg == 'veg'
                                    ? Color.fromARGB(255, 16, 104, 19)
                                    : Color.fromARGB(255, 153, 28, 19),
                                size: 10,
                              ),
                            ]),
                            Row(children: [
                              Icon(
                                Icons.lock_clock,
                                color: Color.fromARGB(255, 90, 12, 12),
                                size: 10,
                              ),
                              Text(
                                "32 min",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ]),
                          ]),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            "quantity".toUpperCase(),
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Text(
                            "${quantity}",
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      )
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  product.image,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            ],
          ),
        ),
        onTap: () {},
      ),
      const Divider(
        color: Color.fromARGB(255, 73, 11, 11),
        height: 25,
        thickness: 1,
        indent: 5,
        endIndent: 5,
      ),
    ]);
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
