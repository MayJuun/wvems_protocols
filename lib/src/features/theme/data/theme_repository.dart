import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'theme_repository.g.dart';

class ThemeRepository {
  ThemeRepository({Color? protocolColor})
      : protocolColor = protocolColor ?? const Color(0xFF6750A4);

  final Color protocolColor;

  /// Subscribe to themeModeChanges to auto-rebuild UI when you swap between
  ///      light mode / dark mode / system default
  ///
  final _themeMode = InMemoryStore<ThemeMode>(ThemeMode.system);
  Stream<ThemeMode> get themeModeChanges => _themeMode.stream;
  void setThemeMode(ThemeMode newValue) => _themeMode.value = newValue;

  /// Set light and dark modes, which currently differ only by brightness
  ///
  ThemeData get lightTheme => _themeData(Brightness.light);
  ThemeData get darkTheme => _themeData(Brightness.dark);

  /// Custom theme settings, imported throughout the app
  ///
  ThemeData _themeData(Brightness brightness) {
    final colorScheme =
        ColorScheme.fromSeed(seedColor: protocolColor, brightness: brightness);
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     backgroundColor: colorScheme.onSecondary),
    );
  }
}

@riverpod
ThemeRepository themeRepository(ThemeRepositoryRef ref) => ThemeRepository();
