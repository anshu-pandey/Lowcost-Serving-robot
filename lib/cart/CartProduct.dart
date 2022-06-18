import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart/CartTotal.dart';
import 'package:flutter_application_2/cart/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/menu/monument_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.product.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductsCard(
                controller: controller,
                product: controller.product.keys.toList()[index],
                quantity: controller.product.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductsCard extends StatelessWidget {
  final CartController controller;
  final MonumentModel product;
  final int quantity;
  final int index;

  const CartProductsCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.index,
      required this.quantity})
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
                            fontWeight: FontWeight.bold),
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
                                fontWeight: FontWeight.normal),
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
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(children: [
                              Text(
                                product.veg_non_veg,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ]),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.removeProduct(product);
                            },
                            icon: Icon(Icons.remove_circle_outline_outlined),
                            color: Color.fromARGB(255, 102, 11, 11),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text("${quantity}"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          IconButton(
                            onPressed: () {
                              controller.add_product(product);
                            },
                            icon: Icon(Icons.add_circle_outline_outlined),
                            color: Color.fromARGB(255, 102, 11, 11),
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
