import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

part 'shared_preferences_sync_service.g.dart';

/// Listens for any changes to parts of the app that
/// need to be stored locally. If those occur, then this
/// service will automatically sync that new change.
class SharedPreferencesSyncService {
  SharedPreferencesSyncService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    /// Listen for changes to the active PDF,
    /// then save a reference in local storage
    ref
          ..listen<AsyncValue<PdfBundle?>>(pdfBundleProvider, (previous, next) {
            final pdfBundle = next.value;
            _saveAssetPathLocally(pdfBundle?.assetPath);
          })

          /// Listen for changes to the current app theme,
          /// then save a reference in local storage
          ..listen<AsyncValue<AppTheme>>(appThemeChangesProvider,
              (previous, next) {
            final appTheme = next.value;
            if (previous is AsyncLoading) {
              // do nothing
            } else {
              _saveAppThemeLocally(appTheme);
            }
          })

          /// Listen for changes to search history,
          /// then save a reference in local storage
          ..listen<AsyncValue<SearchHistory>>(searchHistoryChangesProvider,
              (previous, next) {
            final searchHistory = next.value;
            if (previous is AsyncLoading) {
              // do nothing
            } else {
              _saveSearchHistoryLocally(searchHistory);
            }
          })

          /// Listen for changes to the current search filter,
          /// then saves a reference in local storage
          ..listen<PdfSearchFilters>(searchFilterProvider, (previous, next) {
            final searchFilter = next;
            if (previous is AsyncLoading) {
              // do nothing
            } else {
              _saveSearchFilterLocally(searchFilter);
            }
          })

        // TODO(FireJuun): implement app message local storage
        /// Listen for changes to the saved app messages,
        /// then saves a reference in local storage
        // ..listen<List<AppMessage>>(appMessagesRepositoryProvider,
        //     (previous, next) {
        //   final searchFilter = next;
        //   if (previous is AsyncLoading) {
        //     // do nothing
        //   } else {
        //     _saveSearchFilterLocally(searchFilter);
        //   }
        // })
        ;
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
