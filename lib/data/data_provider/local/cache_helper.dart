import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uae_user/constants/shared_preferences_keys.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static dynamic getDataFromSP({required SharedPreferencesKeys key}) {
    return sharedPreferences.get(key.name);
  }

  static Future<bool> saveDataToSP(
      {required SharedPreferencesKeys key, required dynamic value}) async {
    if (value is bool) {
     // printTest(value.toString());
      return await sharedPreferences.setBool(key.name, value);
    } else if (value is String) {
     // printTest(value.toString());

      return await sharedPreferences.setString(key.name, value);
    } else if (value is int) {
     // printTest(value.toString());

      return await sharedPreferences.setInt(key.name, value);
    } else {
      value ??= 0.0;
     // printTest(value.toString());
      return await sharedPreferences.setDouble(key.name, value);
    }
  }

  static Future<bool> removeDataFromSP({required String key}) async {
    return await sharedPreferences.remove(key);
  }
  static String getCurrentLanguage() {
    String currentDeviceLanguage= Platform.localeName.substring(0,2);
    return sharedPreferences.getString(SharedPreferencesKeys.SP_APP_LANGUAGE.name) ?? "${currentDeviceLanguage}";

  }

}
