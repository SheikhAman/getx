import 'package:get/get.dart';

class Languages extends Translations {
  // 1st languages extends korbe translations tarpor overrive method ta vitore key r against e value rakhbo
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'What is your name',
          'name': 'Sheikh Aman',
        },
        'en_Bn': {
          'message': 'আপনার নাম কি',
          'name': 'শেখ আমান',
        },
      };
}
