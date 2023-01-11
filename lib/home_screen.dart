import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/helper/dialog_helper.dart';
import 'package:getx/screen_one.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Tutorials'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('Getx Dialog Alert'),
              subtitle: Text('Getx Dialog Alert test'),
              onTap: () {
                DialogHelper.showDialog();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Getx Bottom Sheet'),
              subtitle: Text('Getx Bottom Sheet test'),
              onTap: () {
                DialogHelper.showBottomSheet();
              },
            ),
          ),

          SizedBox(
            height: 20,
          ),
// Getx Navigation
          TextButton(
            onPressed: () {
              //  Get.to(ScreenOne( name: ' Sheikh Aman',  ));
              Get.toNamed('/screenOne', arguments: 'Sheikh Aman');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ScreenOne()),
              // );
            },
            child: Text('Go to next screen'),
          ),
        ],
      ),

      // Snackbar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogHelper.showSnackBar('Sheikh Aman', 'Pro Coder');
        },
        child: Center(child: Text('Shackbar')),
      ),
    );
  }
}
