import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
// show  dialog
  static void showDialog() {
    // there are 2 dialog in Getx 1 defaultDialog and 2nd Dialog
    Get.defaultDialog(
        title: 'Delete Chat',
        titlePadding: EdgeInsets.only(top: 30.0),
        contentPadding: EdgeInsets.all(20.0),
        middleText: 'Are you sure you  want to delete text?',
        // textConfirm: 'Yes',
        // textCancel: 'No',
        confirm: ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
              Get.back();
            },
            child: Text('Yes')),
        cancel: ElevatedButton(onPressed: () {}, child: Text('No')),
        // middle text er modle content niye collum use korte pari
        content: Column(
          children: [
            Text('This is content it overrides middle text'),
            Text(
                'if we use content we can use column and have multiple childrens'),
          ],
        ));
  }

// show toast
// show snack bar
  static void showSnackBar(title, message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.add),
      onTap: (snack) {
        print('ontap');
      },
      mainButton: TextButton(onPressed: () {}, child: Text('Hello')),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      reverseAnimationCurve: Curves.easeInOutBack,
    );
  }
// show load
// hide load

// bottomSheet with change Theme
  static void showBottomSheet() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.light_mode),
            title: Text('Light Theme'),
            onTap: () {
              Get.changeTheme(ThemeData.light());
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Theme'),
            onTap: () {
              Get.changeTheme(ThemeData.dark());
            },
          ),
        ],
      ),
    ));
  }
}
