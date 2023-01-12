import 'package:get/get.dart';

// this class will manage your state
class MyController extends GetxController {
  var count = 0.obs;

  void increment() {
    count.value++;
    update();
  }
}
