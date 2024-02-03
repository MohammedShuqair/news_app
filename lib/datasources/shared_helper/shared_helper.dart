import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper instance = SharedHelper._();
  SharedHelper._();

  factory SharedHelper() {
    return instance;
  }

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setMode(ThemeMode mode) async {
    await sharedPreferences.setString("mode", mode.name);
  }

  ThemeMode? getMode() {
    String? mode = sharedPreferences.getString("mode");
    if (mode == null) {
      return null;
    }
    if (mode == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
