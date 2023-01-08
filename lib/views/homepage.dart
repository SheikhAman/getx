import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getx/controllers/product_controller.dart';
import 'package:getx/views/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Get.put hochey dependency injection controller ke dependency te inject korlam. jate kore future e bar bar create kora na lage
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Shop with getx',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return AlignedGridView.count(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
