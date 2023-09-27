import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

part 'shared_preferences_sync_service.g.dart';

class SharedPreferencesSyncService {
  SharedPreferencesSyncService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    /// Listen for changes to the active PDF,
    /// then save a reference to local storage
    ref
      ..listen<AsyncValue<PdfBundle?>>(pdfBundleProvider, (previous, next) {
        final pdfBundle = next.value;
        _saveAssetPathLocally(pdfBundle?.assetPath);
      })

      /// Listen for changes to the current app theme,
      /// then save a reference to local storage
      ..listen<AsyncValue<AppTheme>>(appThemeChangesProvider, (previous, next) {
        final appTheme = next.value;
        if (previous is AsyncLoading) {
          // do nothing
        } else {
          _saveAppThemeLocally(appTheme);
        }
      })

      /// Listen for changes to the current app theme,
      /// then save a reference to local storage
      ..listen<AsyncValue<SearchHistory>>(searchHistoryChangesProvider,
          (previous, next) {
        final searchHistory = next.value;
        if (previous is AsyncLoading) {
          // do nothing
        } else {
          _saveSearchHistoryLocally(searchHistory);
        }
      })

      /// Listen for changes to the current app theme,
      /// then save a reference to local storage
      ..listen<PdfSearchFilters>(searchFilterProvider, (previous, next) {
        final searchFilter = next;
        if (previous is AsyncLoading) {
          // do nothing
        } else {
          _saveSearchFilterLocally(searchFilter);
        }
      });
  }

  Future<void> _saveAssetPathLocally(AssetPaths? assetPath) async {
    ref.read(sharedPreferencesRepositoryProvider).saveActiveAsset(assetPath);
  }

  Future<void> _saveAppThemeLocally(AppTheme? appTheme) async {
    ref.read(sharedPreferencesRepositoryProvider).saveAppTheme(appTheme);
  }

  Future<void> _saveSearchHistoryLocally(SearchHistory? searchHistory) async {
    ref
        .read(sharedPreferencesRepositoryProvider)
        .saveSearchHistory(searchHistory);
  }

  Future<void> _saveSearchFilterLocally(
    PdfSearchFilters? pdfSearchFilter,
  ) async {
    ref
        .read(sharedPreferencesRepositoryProvider)
        .saveSearchFilter(pdfSearchFilter);
  }
}

@Riverpod(keepAlive: true)
SharedPreferencesSyncService sharedPreferencesSyncService(
  SharedPreferencesSyncServiceRef ref,
) {
  return SharedPreferencesSyncService(ref);
}
