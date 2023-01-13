import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.updateLocale(Locale('en', 'US'));
                },
                child: Text('English'),
              ),
              SizedBox(
                width: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    // UPDATE KORE DIBE
                    Get.updateLocale(Locale('en', 'BN'));
                  },
                  child: Text('Bangla')),
            ],
          )
        ],
      ),
    );
  }
}
