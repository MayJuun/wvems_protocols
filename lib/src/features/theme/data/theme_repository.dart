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
    return ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        )
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //     backgroundColor: colorScheme.onSecondary),
        );
  }
}

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
