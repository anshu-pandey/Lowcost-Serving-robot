class FeedbackModel {
  String food_id;
  String food_name;
  String veg_non_veg;
  String cusine_categorie;
  String course_category;
  String ingredient;
  String image;
  int price;
  String description;

  FeedbackModel({
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

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
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
}
