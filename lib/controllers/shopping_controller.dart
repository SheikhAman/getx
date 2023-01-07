import 'package:get/get.dart';

import '../models/product.dart';

class ShoppingController extends GetxController {
// to make your list observable you should write obs with the list you are working with
  /// 1st create observable items like this
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    ///2nd in onInit you can call api if you want
    fetchProduct();
  }

  void fetchProduct() async {
    // i am going to simulate/ fake internet call
    await Future.delayed(Duration(seconds: 1));
    // assume this data  came from api
    var serverResponse = [
      Product(
        id: 1,
        price: 30,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'FirstProd',
      ),
      Product(
        id: 2,
        price: 40,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'Secprod',
      ),
      Product(
        id: 3,
        price: 49.5,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'Secprod',
      ),
    ];

    // we are going to assign serverResponse to observable instance
    products.value = serverResponse;
  }
}
