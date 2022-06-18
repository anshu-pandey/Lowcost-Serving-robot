import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dish_info/dish_info.dart';
import 'package:flutter_application_2/cart/cart_controller.dart';
import 'package:flutter_application_2/menu/monument_model.dart';
import 'package:get/get.dart';

class food_s extends StatelessWidget {
  final Future<List<MonumentModel>> monuments;

  food_s({Key? key, required this.monuments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MonumentModel>>(
      future: monuments,
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? monumentList(context, snapshot.data ?? [])
            : Center(
                child: CircularProgressIndicator(
                color: Color.fromARGB(255, 119, 24, 18),
              ));
      },
    );
  }
}

Widget monumentList(context, List<MonumentModel> monument_List) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height, // constrain height
        child: ListView.builder(
            itemCount: monument_List.length,
            itemBuilder: (context, index) {
              return FeedbackTile(
                index: index,
                Monument_List: monument_List,
                food_id: monument_List[index].food_id,
                food_name: monument_List[index].food_name,
                veg_non_veg: monument_List[index].veg_non_veg,
                cusine_categorie: monument_List[index].cusine_categorie,
                course_category: monument_List[index].course_category,
                ingredient: monument_List[index].ingredient,
                image: monument_List[index].image,
                price: monument_List[index].price,
                description: monument_List[index].description,
              );
            }),
      ),
    ],
  );
}

class FeedbackTile extends StatelessWidget {
  final cartController = Get.put(CartController());

  final int index;
  final List<MonumentModel> Monument_List;
  final String food_id;
  final String food_name;
  final String veg_non_veg;
  final String cusine_categorie;
  final String course_category;
  final String ingredient;
  final String image;
  final int price;
  final String description;

  FeedbackTile({
    required this.index,
    required this.Monument_List,
    required this.food_id,
    required this.food_name,
    required this.veg_non_veg,
    required this.cusine_categorie,
    required this.course_category,
    required this.ingredient,
    required this.image,
    required this.price,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                        food_name.toUpperCase(),
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
                            description,
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
                              "\Rs.$price",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(children: [
                              Text(
                                veg_non_veg,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.circle,
                                color: veg_non_veg == 'veg'
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
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            ],
          ),
        ),
        onTap: () {
          Route route = MaterialPageRoute(
              builder: (context) => dish_info(
                    veg_non_veg: veg_non_veg,
                    cusine_categorie: cusine_categorie,
                    course_category: course_category,
                    ingredient: ingredient,
                    image: image,
                    price: price,
                    description: description,
                    food_name: food_name,
                    index: index,
                    Monument_List: Monument_List,
                  ));
          Navigator.push(context, route);
        },
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
