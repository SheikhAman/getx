import 'package:get/state_manager.dart';
import 'package:getx/models/product.dart';
import 'package:getx/services/api_services.dart';

class ProductController extends GetxController {
  // if data changes it will update automatically
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    // TODO: implement onInit
    super.onInit();
  }

  void fetchProducts() async {
    try {
      // aivabe o obs use kora jai
      isLoading(true);
      var products = await ApiServices.fetchProduct();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      // exception hole o isLoading  false kore dibe
      isLoading(false);
    }
  }
}
