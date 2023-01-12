import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<MyController>(
            builder: (controller) => Text('${controller.count.value}'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<MyController>().increment();
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
