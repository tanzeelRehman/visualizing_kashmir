import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LanguageController extends GetxController {
  String selectedLanguage = 'EN';

  void changeLanguage(String language) {
    selectedLanguage = language;
    update();
  }
}
