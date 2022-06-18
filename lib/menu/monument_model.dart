import 'dart:convert';

import 'package:http/http.dart' as http;

class MonumentModel {
  String food_id;
  String food_name;
  String veg_non_veg;
  String cusine_categorie;
  String course_category;
  String ingredient;
  String image;
  int price;
  String description;

  MonumentModel({
    this.food_id = "",
    this.food_name = "",
    this.veg_non_veg = "",
    this.cusine_categorie = "",
    this.course_category = "",
    this.ingredient = "",
    this.image = "",
    this.price = 0,
    this.description = "",
  });

  factory MonumentModel.fromJson(dynamic json) {
    return MonumentModel(
      food_id: "${json['food_id']}",
      food_name: "${json['food_name']}",
      veg_non_veg: "${json['veg/non-veg']}",
      cusine_categorie: "${json["cusine_categories"]}",
      course_category: "${json['course_category ']}",
      ingredient: "${json['Ingredient']}",
      image: "${json["Image"]}",
      price: json['price'],
      description: "${json['description ']}",
    );
  }

  Map toJson() => {
        'food_id': food_id,
        'food_name': food_name,
        'veg/non-veg': veg_non_veg,
        "cusine_categories": cusine_categorie,
        'course_category ': course_category,
        'Ingredient': ingredient,
        'Image': image,
        'price': price,
        'description ': description,
      };

  List<MonumentModel> decodeMonument(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<MonumentModel>((json) => MonumentModel.fromJson(json))
        .toList();
  }

  Future<List<MonumentModel>> fetchMonument() async {
    var url = Uri.parse("hxec");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return decodeMonument(response.body);
    } else {
      throw Exception('Unable to fetch data from the REST API');
    }
  }
}
