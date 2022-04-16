import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static SharedPreferences ? _preferences;

  static Future init() async =>
      _preferences= await SharedPreferences.getInstance();


  static Future setStringValue(String key, String value) async =>
      await _preferences?.setString(key, value);

  static String? getStringValue(String key)  => _preferences?.getString(key);

  static Future setIntValue(String key, int value) async =>
      await _preferences?.setInt(key, value);

  static int? getIntValue(String key) => _preferences?.getInt(key);

  static Future setBoolValue(String key, bool value) async =>
      await _preferences?.setBool(key, value);

  static bool? getBoolValue(String key) => _preferences?.getBool(key);

}