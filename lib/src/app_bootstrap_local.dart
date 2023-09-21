import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../wvems_protocols.dart';

/// Original source: Andrea Bizzotto
/// https://github.com/bizz84/complete-flutter-course
///
class AppBootstrapLocal extends AppBootstrap {
  /// Creates the top-level [ProviderContainer] by overriding providers with real or fake
  /// repositories. This is useful for testing purposes and for running the
  /// app with a "fake" backend.
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
  Future<ProviderContainer> createLocalProviderContainer(
      {bool addDelay = false}) async {
    final prefs = await SharedPreferences.getInstance();
    final SharedPreferencesRepository sharedPreferencesRepository =
        SharedPreferencesRepository(prefs);

    final assetPath = sharedPreferencesRepository.getActiveAsset();
    final PdfBundleRepository pdfBundleRepository = PdfBundleRepository();

    if (assetPath != null) {
      await pdfBundleRepository.setPdfBundleFromAsset(assetPath);
    }

    final lastTheme = sharedPreferencesRepository.getAppTheme();
    final ThemeRepository themeRepository = ThemeRepository(lastTheme);

    return ProviderContainer(overrides: [
      // repositories
      sharedPreferencesRepositoryProvider
          .overrideWithValue(sharedPreferencesRepository),
      themeRepositoryProvider.overrideWithValue(themeRepository),
      pdfBundleRepositoryProvider.overrideWithValue(pdfBundleRepository),
    ], observers: [
      AsyncErrorLogger()
    ]);
  }
}
