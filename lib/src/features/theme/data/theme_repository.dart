import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'theme_repository.g.dart';

class ThemeRepository {
  ThemeRepository(this._lastTheme);

  /// This is loaded from local storage, if that has been set
  final AppTheme _lastTheme;

  /// Auto-rebuild UI when theme settings or colors change
  ///
  late final _appTheme = InMemoryStore<AppTheme>(_lastTheme);

  Stream<AppTheme> get appThemeChanges => _appTheme.stream;

  /// Used to modify entire app theme, or manually set each part
  ///
  void setAppTheme(AppTheme newValue) => _appTheme.value = newValue;
  void setAppThemeMode(ThemeMode newValue) => _appTheme.value =
      AppTheme(themeMode: newValue, seedColor: _appTheme.value.seedColor);
  void setAppSeedColor(Color newValue) => _appTheme.value =
      AppTheme(themeMode: _appTheme.value.themeMode, seedColor: newValue);

  /// Set light and dark modes, which currently differ only by brightness
  ///
  ThemeData get lightTheme => _themeData(Brightness.light);
  ThemeData get darkTheme => _themeData(Brightness.dark);

  /// Custom theme settings, imported throughout the app
  ///
  ThemeData _themeData(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
        seedColor: _appTheme.value.seedColor, brightness: brightness);

    final textTheme = _buildTextTheme();
    return ThemeData(
      textTheme: textTheme,
      colorScheme: colorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: textTheme.bodyMedium,
        menuStyle: const MenuStyle(
            visualDensity: VisualDensity.compact,
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 0, horizontal: 8))),
      ),
      chipTheme: ChipThemeData(
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        labelStyle:
            textTheme.bodySmall!.apply(color: colorScheme.onPrimaryContainer),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          shape: CircleBorder(),
          smallSizeConstraints: BoxConstraints(minWidth: 48, minHeight: 48)),
    );
  }
}

TextTheme _buildTextTheme() {
  return TextTheme(
    displayLarge: _style(96.0, FontWeight.normal),
    displayMedium: _style(60.0, FontWeight.bold),
    displaySmall: _style(48.0, FontWeight.normal),
    headlineMedium: _style(36.0, FontWeight.bold),
    headlineSmall: _style(22.0, FontWeight.w500),
    titleLarge: _style(18.0, FontWeight.w500),
    bodyLarge: _style(18.0, FontWeight.normal),
    bodyMedium: _style(16.0, FontWeight.normal),
    titleMedium: _style(12.0, FontWeight.normal),
    titleSmall: _style(12.0, FontWeight.w300),
    labelLarge: _style(18.0, FontWeight.normal),
    bodySmall: _style(12.0, FontWeight.normal),
    labelSmall: _style(12.0, FontWeight.normal),
  );
}

TextStyle _style(double s, FontWeight w) =>
    TextStyle(fontSize: s, fontWeight: w);

@Riverpod(keepAlive: true)
ThemeRepository themeRepository(ThemeRepositoryRef ref) {
  // set this in the app bootstrap section
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
Stream<AppTheme> appThemeChanges(AppThemeChangesRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  return themeRepository.appThemeChanges;
}
