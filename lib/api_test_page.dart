import 'package:flutter/material.dart';
import 'package:getx/controller/test_controller.dart';
import 'package:getx/services/base_client.dart';

// using this api https://jsonplaceholder.typicode.com/todos/1

class ApiTestPage extends StatelessWidget {
  final controller = TestController();
  ApiTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Test Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                controller.getData();
              },
              child: Text('Get Data'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text('Post Data'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text('Put Data'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text('Delete Data'),
            ),
          ],
        ),
      ),
    );
  }
}
