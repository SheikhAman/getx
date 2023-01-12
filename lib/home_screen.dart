import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Tutorials'),
      ),
      body: Column(
        children: [
          Container(
            /*
            height protita device very kore
           height * 1 mane full screen occupy korbe
           */
            /// height: MediaQuery.of(context).size.height,
            height: Get.height * 0.2,
            width: Get.width * 0.9,
            color: Colors.red,
            child: Center(
              child: Text('Center'),
            ),
          ),
          Container(
            height: Get.height * 0.1,
            width: Get.width * 0.9,
            color: Colors.blue,
            child: Center(
              child: Text('Center'),
            ),
          ),
        ],
      ),
    );
  }
}
