import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'package:wvems_protocols/firebase_options_dev.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await _initializeFirebase();
  await handleBackgroundMessage(message);
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final token = await FirebaseMessaging.instance.getToken();
  debugPrint('token: $token');

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeFirebase();
  // Set the background messaging handler early, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // ensure URL changes in the address bar when using push / pushNamed
  // more info here: https://docs.google.com/document/d/1VCuB85D5kYxPR3qYOjVmw8boAGKb7k62heFyfFHTOvw/edit
  GoRouter.optionURLReflectsImperativeAPIs = true;

  final appBootstrap = AppBootstrapLocal();
  // * Create ProviderContainer with any required overrides
  final container = await appBootstrap.createLocalProviderContainer();

// use the container above to create the root widget
  final root = appBootstrap.createRootWidget(container: container);
  // start the app
  runApp(root);
}
