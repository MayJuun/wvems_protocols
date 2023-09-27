import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

/// Original source: Andrea Bizzotto
/// https://github.com/bizz84/complete-flutter-course
///
class AppBootstrapLocal extends AppBootstrap {
  /// Creates the top-level [ProviderContainer] by overriding providers with
  /// real or fake repositories. This is useful for testing purposes and for
  /// running the app with a "fake" backend.
  ///
  /// Note: all repositories needed by the app can be accessed via providers.
  /// Some of these providers throw an [UnimplementedError] by default.
  ///
  /// Example:
  /// ```dart
  /// @Riverpod(keepAlive: true)
  /// SomeRepository someRepository(SomeRepositoryRef ref) {
  ///   throw UnimplementedError();
  /// }
  /// ```
  ///
  /// As a result, this method does two things:
  /// - create and configure the repositories as desired
  /// - override the default implementations with a list of "overrides"
  ///
  Future<ProviderContainer> createLocalProviderContainer({
    bool addDelay = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final sharedPreferencesRepository = SharedPreferencesRepository(prefs);

    final assetPath = sharedPreferencesRepository.getActiveAsset();
    final pdfBundleRepository = PdfBundleRepository();

    if (assetPath != null) {
      await pdfBundleRepository.setPdfBundleFromAsset(assetPath);
    }

    final lastTheme = sharedPreferencesRepository.getAppTheme();
    final themeRepository = ThemeRepository(lastTheme);

    // final searchFilter = sharedPreferencesRepository.getSearchFilter();
    final searchHistory = sharedPreferencesRepository.getSearchHistory();
    final searchHistoryRepository = SearchHistoryRepository(searchHistory);

    return ProviderContainer(
      overrides: [
        // repositories
        sharedPreferencesRepositoryProvider
            .overrideWithValue(sharedPreferencesRepository),
        themeRepositoryProvider.overrideWithValue(themeRepository),
        pdfBundleRepositoryProvider.overrideWithValue(pdfBundleRepository),
        searchHistoryRepositoryProvider
            .overrideWithValue(searchHistoryRepository),
      ],
      observers: [
        AsyncErrorLogger(),
      ],
    );
  }
}
