import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/languages.dart';

import 'home_screen.dart';

void main() {
  // registering my controller up in the widget tree

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale(
        'en',
        'US',
      ),

      // kono language select na thakle by default english select kore dilam
      translations: Languages(),

      // fallbackLocale: Locale('en', 'bn'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
