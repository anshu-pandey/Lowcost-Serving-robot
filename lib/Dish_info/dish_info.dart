import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dish_info/body.dart';
import 'package:flutter_application_2/menu/monument_model.dart';

import '../component/header.dart';

class dish_info extends StatelessWidget {
  dish_info({
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

  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const header(text: "   "),
      body: body(
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
      ),
    );
  }
}
