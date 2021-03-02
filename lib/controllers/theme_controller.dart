import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wvems_protocols/themes.dart';

// spec: https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405

class ThemeController extends GetxService {
  static ThemeController get to => Get.find();

  SharedPreferences prefs;

  // App Themes (Light vs Dark)
  final AppTheme _lightTheme = AppTheme.fromType(ThemeType.LightMode);
  AppTheme get lightTheme => _lightTheme;
  final AppTheme _darkTheme = AppTheme.fromType(ThemeType.DarkMode);
  AppTheme get darkTheme => _darkTheme;

  // _themeMode necessary for main.dart calls
  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  set themeMode(value) => _themeMode = value;

  Future<void> setThemeMode(ThemeMode obj) async {
    // Change theme, then update ThemeMode notifiers
    Get.changeThemeMode(obj);
    _themeMode = obj;

    // Save data for later retrieval
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.toString().split('.')[1]);
  }

  Future<void> getThemeModeFromPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final String themeText = prefs.getString('theme') ?? 'system';
    try {
      _themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      _themeMode = ThemeMode.system;
    }
  }

  AppTheme getAppThemeFromBrightness(Brightness b) {
    return (b == Brightness.dark) ? _darkTheme : _lightTheme;
  }

  Future<ThemeController> init() async {
    await getThemeModeFromPreferences();
    return this;
  }
}
