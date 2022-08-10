import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsServices {
  static final String _key = 'key';

  static save(String user) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString(
        _key,
        jsonEncode({
          "user": user,
          "isAuth": true,
        }));
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var result = prefs.getString(_key);

    if (result != null) {
      var userMap = jsonDecode(result);

      return userMap['isAuth'];
    }

    return false;
  }

  static logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }
}
