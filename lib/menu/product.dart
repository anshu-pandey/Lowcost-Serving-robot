import 'package:flutter_application_2/menu/monument_model.dart';
import 'package:get/get.dart';

import '../cart/cart_controller.dart';

class product {
  final String food_id;
  final String food_name;
  final String veg_non_veg;
  final String cusine_categorie;
  final String course_category;
  final String ingredient;
  final String image;
  final int price;
  final String description;

  product({
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

  static Future<List<MonumentModel>> monument_Model =
      MonumentModel().fetchMonument();
}
