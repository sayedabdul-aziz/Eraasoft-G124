import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences pref;

  static String tokenKey = "token";

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static cacheData(String key, dynamic value) async {
    if (value is String) {
      await pref.setString(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else {
      await pref.setStringList(key, value);
    }
  }

  static getCachedData(String key) {
    return pref.get(key);
  }

  static clearCachedData(String key) {
    return pref.remove(key);
  }
}
