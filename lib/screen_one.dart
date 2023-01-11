import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screen_two.dart';

class ScreenOne extends StatefulWidget {
  final String name;
  const ScreenOne({super.key, this.name = ''});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One' + widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                // Navigator.pop(context);

                Get.to(ScreenTwo());
              },
              child: Text('Go to screen two'),
            ),
          ),
        ],
      ),
    );
  }
}
