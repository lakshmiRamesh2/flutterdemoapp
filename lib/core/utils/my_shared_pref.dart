import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {

  static const LAST_LOADED_DATE = "last_loaded_date";
  static const TOKEN = "token";
  static const USER_NAME = "user_name";

  final SharedPreferences _pref;

  MySharedPref(this._pref);

  void saveLastLoadedState(String dateTime) {
    _pref.setString(LAST_LOADED_DATE, dateTime);
  }

  String getLastLoadedState() {
    return _pref.getString(LAST_LOADED_DATE);
  }

  void saveToken(String token) {
    _pref.setString(TOKEN, token);
  }

  String getToken() {
    return _pref.getString(TOKEN);
  }

  void saveUserName(String userName) {
    _pref.setString(USER_NAME, userName);
  }

  String getUserName() {
    return _pref.getString(USER_NAME);
  }
}