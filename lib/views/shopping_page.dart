import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  /// 4th we will make instance of  controller here
  /// Get.put mane dependency injection marlam jate pore hierarchy te value use kote  parbo controller er(It is preferred way for defining controllers)
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) => ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      '${controller.products[index].productDescription}',
                                    ),
                                  ],
                                ),
                                Text(
                                  '${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: Text('Add to Cart'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GetX<CartController>(
                builder: (controller) => Text(
                      'Total amount: \$ ${controller.totalPrice}',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    )),
            SizedBox(
              height: 100.0,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(
          builder: (controller) => Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
