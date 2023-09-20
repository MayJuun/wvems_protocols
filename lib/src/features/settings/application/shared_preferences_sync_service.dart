import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/src/features/settings/data/shared_preferences_repository.dart';

import '../../../../wvems_protocols.dart';

part 'shared_preferences_sync_service.g.dart';

class SharedPreferencesSyncService {
  SharedPreferencesSyncService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    /// Listen for changes to the active PDF, then save a reference to local storage
    ref.listen<AsyncValue<PdfBundle?>>(pdfBundleProvider, (previous, next) {
      final pdfBundle = next.value;
      _saveAssetPathLocally(pdfBundle?.assetPath);
    });

    /// Listen for changes to the current app theme, then save a reference to local storage
    ref.listen<AsyncValue<AppTheme>>(appThemeChangesProvider, (previous, next) {
      final appTheme = next.value;
      if (previous is AsyncLoading) {
        // do nothing
      } else {
        _saveAppThemeLocally(appTheme);
      }
    });
  }

  Future<void> _saveAssetPathLocally(AssetPaths? assetPath) async {
    ref.read(sharedPreferencesRepositoryProvider).saveActiveAsset(assetPath);
  }

  Future<void> _saveAppThemeLocally(AppTheme? appTheme) async {
    ref.read(sharedPreferencesRepositoryProvider).saveAppTheme(appTheme);
  }
}

@Riverpod(keepAlive: true)
SharedPreferencesSyncService sharedPreferencesSyncService(
    SharedPreferencesSyncServiceRef ref) {
  return SharedPreferencesSyncService(ref);
}
