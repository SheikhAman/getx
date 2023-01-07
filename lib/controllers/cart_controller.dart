import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  int get count => cartItems.length;

  // var testAmount = 0.0;

  // ai getter property observable korar dorkar nai karon se listen korche
  // total amount
  double get totalPrice => cartItems.fold(
        0,
        (sum, item) => sum + item.price!.toDouble(),
      );

  addToCart(Product product) {
    cartItems.add(product);
    // testAmount = totalPrice;
    // update();
  }
}
