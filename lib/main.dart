import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'wvems_protocols.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // final localCartRepository = await SembastCartRepository.makeDefault();
  // * Create ProviderContainer with any required overrides
  final container = ProviderContainer(
    overrides: [
      // localCartRepositoryProvider.overrideWithValue(localCartRepository),
    ],
    observers: [AsyncErrorLogger()],
  );
  // * Initialize CartSyncService to start the listener
  // container.read(cartSyncServiceProvider);
  final errorLogger = container.read(errorLoggerProvider);
  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors
  registerErrorHandlers(errorLogger);
  // * Entry point of the app
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ));
}

/// Original source: Andrea Bizzotto
/// https://github.com/bizz84/complete-flutter-course
///
void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
