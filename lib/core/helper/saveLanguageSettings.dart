import 'package:shared_preferences/shared_preferences.dart';
import 'package:visualizing_kashmir/core/constants/constant_names.dart';
import 'package:visualizing_kashmir/core/globle/globle.dart';

class SaveLanguageSettings {
  static saveLanguage(String languageCode, String countryCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLanguageCode = languageCode;
    selectedLanguageCountry = countryCode;
    await prefs.setString(ConstantNames.languageCode.name, languageCode);
    await prefs.setString(ConstantNames.countryCode.name, countryCode);
  }

  static getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? languageCode =
        prefs.getString(ConstantNames.languageCode.name);
    selectedLanguageCode = languageCode ?? 'en';
  }

  static getLanguageCountry() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? languageCountry =
        prefs.getString(ConstantNames.countryCode.name);
    selectedLanguageCountry = languageCountry ?? 'US';
  }

  static setOpenFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(ConstantNames.firstTimeOpened.name, true);
  }

  static isOpenedFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? opened = prefs.getBool(ConstantNames.firstTimeOpened.name);

    return opened ?? false;
  }
}
