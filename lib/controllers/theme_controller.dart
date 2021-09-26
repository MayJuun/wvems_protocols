import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_reference/_internal/utils/utils.dart';
import 'package:quick_reference/controllers/controllers.dart';
import 'package:quick_reference/themes.dart';

// spec: https://github.com/FireJuun/prapare/blob/main/lib/controllers/theme_controller.dart
// spec: https://github.com/delay/flutter_starter
// https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405
// https://medium.com/swlh/flutter-dynamic-themes-in-3-lines-c3b375f292e3

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final StorageController _data = Get.find();

  final themeString = ''.obs;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
  String get currentTheme => themeString.value;

  @override
  Future<void> onReady() async {
    await getThemeModeFromStore();
    super.onReady();
  }

  Future<void> setThemeMode(ThemeMode obj) async {
    themeString.value = ThemeModeUtil().convertThemeModeToString(obj);
    _themeMode = obj;
    Get.changeThemeMode(_themeMode);
    await _data.store.write('theme', themeString.value);

    Get.changeTheme(
        isDarkModeOn ? darkTheme.value.themeData : lightTheme.value.themeData);
  }

  ThemeMode _getThemeModeFromString(String theme) {
    ThemeMode _setThemeMode = ThemeMode.system;
    if (theme == 'light') {
      _setThemeMode = ThemeMode.light;
    }
    if (theme == 'dark') {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  Future<void> getThemeModeFromStore() async {
    final String _themeString = _data.store.read('theme') ?? 'system';
    await setThemeMode(_getThemeModeFromString(_themeString));
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      if (WidgetsBinding.instance?.window.platformBrightness ==
          Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }

  ThemeData getThemeDataFromThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return lightTheme.value.themeData;
      case ThemeMode.dark:
        return darkTheme.value.themeData;
      default:
        return lightTheme.value.themeData;
    }
  }

  // App Themes (Light vs Dark)
  final Rx<AppTheme> lightTheme =
      AppTheme.fromType(themeType: ThemeType.LightMode).obs;
  final Rx<AppTheme> darkTheme =
      AppTheme.fromType(themeType: ThemeType.DarkMode).obs;

  void setThemeColorsFromPdfData(Color primaryColor) {
    lightTheme.value = AppTheme.fromType(
      themeType: ThemeType.LightMode,
      primaryColor: primaryColor,
    );
    darkTheme.value = AppTheme.fromType(
      themeType: ThemeType.DarkMode,
      primaryColor: primaryColor,
    );
    _updateTheme();
  }

  void _updateTheme() {
    Get.changeTheme(
        isDarkModeOn ? darkTheme.value.themeData : lightTheme.value.themeData);
    update();
  }

  AppTheme getAppThemeFromBrightness(Brightness b) {
    return (b == Brightness.dark) ? darkTheme.value : lightTheme.value;
  }
}
