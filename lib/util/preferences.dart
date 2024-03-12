import 'dart:convert' show jsonEncode;

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil{
  static late SharedPreferences _prefs;

  static final PreferencesUtil _instance = PreferencesUtil._internal();

  factory PreferencesUtil() => _instance;

  PreferencesUtil._internal();

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool getBool(String key) => _prefs.getBool(key) ?? false;

  Future<bool> setBool(String key,bool value)=> _prefs.setBool(key, value);


  String getString(String key) => _prefs.getString(key) ?? '';

  Future<bool> setString(String key,String value) => _prefs.setString(key,value);


  getJson(String key)=> jsonEncode(_prefs.getString(key) ?? "");


  int getInt(String key)=> _prefs.getInt(key) ?? 0;

  Future<bool> remove(String key) => _prefs.remove(key);
}