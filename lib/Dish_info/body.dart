import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart/cart_controller.dart';
import 'package:flutter_application_2/menu/monument_model.dart';
import 'package:get/get.dart';

class body extends StatelessWidget {
  body({
    Key? key,
    required this.food_name,
    required this.veg_non_veg,
    required this.cusine_categorie,
    required this.course_category,
    required this.ingredient,
    required this.image,
    required this.price,
    required this.description,
    required this.index,
    required this.Monument_List,
  }) : super(key: key);

  final String food_name;
  final String veg_non_veg;
  final String cusine_categorie;
  final String course_category;
  final String ingredient;
  final String image;
  final int price;
  final String description;
  final int index;
  final List<MonumentModel> Monument_List;
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final names = ingredient;
    final splitNames = names.split(',');
    List splitList = [];
    for (int i = 0; i < splitNames.length; i++) {
      splitList.add(splitNames[i]);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.075,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.30,
              child: new Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            small_case(food_name.toUpperCase()),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            Container(
              child: Row(children: [
                Icon(
                  Icons.star_rate,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                  "4.2",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
              ]),
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 93, 12, 12),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.007)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Flexible(
              child: small_case(
                "23,222 ratings",
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(children: [
            SizedBox(
              width: 50,
            ),
            small_case(
              "Rs." + price.toString().toUpperCase(),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.circle,
              color: veg_non_veg == 'veg'
                  ? Color.fromARGB(255, 16, 104, 19)
                  : Color.fromARGB(255, 153, 28, 19),
              size: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: 7,
            ),
            small_case(
              veg_non_veg.toUpperCase(),
            ),
            SizedBox(
              width: 20,
            ),
            small_case(
              cusine_categorie.toUpperCase(),
            ),
            SizedBox(
              width: 20,
            ),
            small_case(
              course_category.toUpperCase(),
            ),
          ]),
          Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          small_case("ingredient".toUpperCase()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: splitList.length,
              itemBuilder: (context, index) {
                return Row(children: [
                  Container(
                    child: ListTile(
                      title: small_case_white(
                        splitList[index],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 87, 12, 12),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.01,
                  )
                ]);
              },
            ),
          ),
          Divider(),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            small_case("description".toUpperCase()),
            Icon(Icons.description_outlined)
          ]),
          Text(
            description,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          Divider(),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 102, 11, 11)),
            ),
            onPressed: () {
              cartController.add_product(Monument_List[index]);
            },
            child: Text('ADD TO CART'),
          ),
        ],
      ),
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
          fontSize: 12.7,
          decoration: TextDecoration.none));
}

Text small_case_white(String text) {
  return Text(text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.w700,
          fontSize: 12.7,
          decoration: TextDecoration.none));
}
