import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';

class LanguageController extends GetxController {
  String selectedLanguage = selectedLanguageCode;

  void changeLanguage(String language) {
    selectedLanguage = language;
    update();
  }
}
