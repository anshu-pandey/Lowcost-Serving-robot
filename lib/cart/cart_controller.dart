import 'package:flutter_application_2/menu/monument_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // add dic to store the product into cart
  var _products = {}.obs;
  void add_product(MonumentModel product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  void removeProduct(MonumentModel product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get product => _products;
  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => (value + element));
}
