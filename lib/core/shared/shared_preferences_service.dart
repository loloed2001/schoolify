import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._();
  static late final SharedPreferences sp;
  static Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  static Future<void> storeToken(String token) async {
    await sp.setString('token', token);
  }

  static String? getToken() {
    return sp.getString('token');
  }

  static String? getUser() {
    return sp.getString('user');
  }

  static Future<void> storeUser(String user) async {
    await sp.setString('user', user);
  }

  static String? getChilds() {
    return sp.getString('childs');
  }

  static Future<void> storeChilds(String childs) async {
    await sp.setString('childs', childs);
  }

  static String? getLangauge() {
    return sp.getString('language');
  }

  static Future<void> storeLangauge(String language) async {
    await sp.setString('language', language);
  }

  static Future<void> storeType(String type) async {
    await sp.setString('type', type);
  }

  static String? getType() {
    return sp.getString('type');
  }

  static Future<bool> clearAll() async {
    return await sp.clear();
  }
}
