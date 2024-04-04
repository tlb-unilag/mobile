import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> removeToken() async {
    await prefs.remove('token');
  }

  static Future<void> setToken(String token) async {
    await prefs.setString('token', token);
  }

  static String? get token {
    return prefs.getString('token');
  }

  static Future<void> setOnboarded(bool isOnboarded) async {
    await prefs.setBool('isOnboarded', isOnboarded);
  }

  static bool get isOnboarded {
    return prefs.getBool('isOnboarded') ?? false;
  }

  static Future<void> setEmail(String token) async {
    await prefs.setString('email', token);
  }

  static String? get email {
    return prefs.getString('email');
  }

  static Future<void> setCountryState(String token) async {
    await prefs.setString('countryState', token);
  }

  static String? get countryState {
    return prefs.getString('countryState');
  }

  static Future<void> setCountry(String token) async {
    await prefs.setString('country', token);
  }

  static String? get country {
    return prefs.getString('country');
  }

  
  // what if the file path has been moved or doesnt exist anymore?
  static Future<void> saveImageFile(String imagePath) async {
    await prefs.setString('imagePath', imagePath);
  }

   static Future<String?> getImageFilePath() async {
    return prefs.getString('imagePath');
  }

}
