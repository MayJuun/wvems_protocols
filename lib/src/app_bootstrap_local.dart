import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
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

    final firebaseMessagingRepository = FirebaseMessagingRepository();
    final appMessages = sharedPreferencesRepository.getAppMessages();
    final appMessagesRepository = AppMessagesRepository(appMessages);

    return ProviderContainer(
      overrides: [
        // repositories
        sharedPreferencesRepositoryProvider
            .overrideWithValue(sharedPreferencesRepository),
        themeRepositoryProvider.overrideWithValue(themeRepository),
        pdfBundleRepositoryProvider.overrideWithValue(pdfBundleRepository),
        searchHistoryRepositoryProvider
            .overrideWithValue(searchHistoryRepository),
        firebaseMessagingRepositoryProvider
            .overrideWithValue(firebaseMessagingRepository),
        appMessagesRepositoryProvider.overrideWithValue(appMessagesRepository),
      ],
      observers: [
        AsyncErrorLogger(),
      ],
    );
  }
}

/// Note: there is an issue where this handler is not called consistently
/// if an iOS app has been terminated (closed / swiped away).
/// The first message is displayed, but doesn't call this handler.
/// After sending a second (or more) message from this terminated state, then
/// the handler again works as intended.
///
/// Discussed here: https://github.com/firebase/flutterfire/issues/11500
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  final prefs = await SharedPreferences.getInstance();
  final sharedPreferencesRepository = SharedPreferencesRepository(prefs);

  final appMessages = sharedPreferencesRepository.getAppMessages();
  final appMessage = remoteMessageToAppMessage(message);

  if (appMessages.contains(appMessage)) {
    debugPrint('Message already present. Skipped');
    return;
  }

  final newAppMessages = [
    appMessage,
    ...appMessages,
  ];

  sharedPreferencesRepository.saveAppMessages(newAppMessages);
  await prefs.reload();

  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
    print('Message data: ${message.data}');
    print('Message title: ${message.notification?.title}');
    print('Message body: ${message.notification?.body}');
  }
}
