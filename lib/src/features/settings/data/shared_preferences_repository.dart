import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../wvems_protocols.dart';

part 'shared_preferences_repository.g.dart';

enum _StoredValues { appTheme, assetPath }

class SharedPreferencesRepository {
  SharedPreferencesRepository(this._prefs);

  final SharedPreferences _prefs;

  void saveAppTheme(AppTheme? appTheme) {
    if (appTheme == null) {
      _prefs.remove(_StoredValues.appTheme.name);
    } else {
      _prefs.setString(_StoredValues.appTheme.name, appTheme.toJson());
    }
  }

  AppTheme getAppTheme() {
    final appThemeString = _prefs.getString(_StoredValues.appTheme.name);
    if (appThemeString != null) {
      return AppTheme.fromJson(appThemeString);
    } else {
      return kFirstAppTheme;
    }
  }

  void saveActiveAsset(AssetPaths? assetPath) {
    if (assetPath == null) {
      _prefs.remove(_StoredValues.assetPath.name);
    } else {
      _prefs.setString(_StoredValues.assetPath.name, assetPath.name);
    }
  }

  AssetPaths? getActiveAsset() {
    final assetPathString = _prefs.getString(_StoredValues.assetPath.name);
    if (assetPathString != null && assetPathString.isNotEmpty) {
      /// need a random asset just to call this enhanced enum method
      /// probably not the most ideal location for that method (?utils)...but it works
      return AssetPaths.values.first.fromString(assetPathString);
    } else {
      return null;
    }
  }
}

@Riverpod(keepAlive: true)
SharedPreferencesRepository sharedPreferencesRepository(
    SharedPreferencesRepositoryRef ref) {
  // needs to be set in bootstrap
  throw UnimplementedError();
}
