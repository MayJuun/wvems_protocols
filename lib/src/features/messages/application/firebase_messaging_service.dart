import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'firebase_messaging_service.g.dart';

/// This background handler occurs outside of the normal app isolate
/// Thus, any new message should be stored locally in sharedPreferences
/// It will be shown on the next app reload.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage remoteMessage,
) async {
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  await prefs.reload();

  final sharedPreferencesRepository = SharedPreferencesRepository(prefs);
  final appMessages = sharedPreferencesRepository.getAppMessages();
  final appMessage = remoteMessageToAppMessage(remoteMessage);

  if (appMessages.contains(appMessage)) {
    debugPrint('Message already present. Skipped');
    return;
  }

  final newAppMessages = [
    appMessage,
    ...appMessages,
  ];

  sharedPreferencesRepository.saveAppMessages(newAppMessages);

  if (kDebugMode) {
    print('Handling a background message: ${remoteMessage.messageId}');
    print('Message data: ${remoteMessage.data}');
    print('Message notification: ${remoteMessage.notification?.title}');
    print('Message notification: ${remoteMessage.notification?.body}');
  }
}

/// This service occurs in the foreground when an app is running.
class FirebaseMessagingService {
  FirebaseMessagingService(this.ref) {
    _init();
  }

  final Ref ref;
  final messaging = FirebaseMessaging.instance;
  late final NotificationSettings settings;
  late final String? token;

  final _remoteMessage = InMemoryStore<RemoteMessage?>(null);

  Future<RemoteMessage?> fetchLastMessage() async => _remoteMessage.value;

  Stream<RemoteMessage?> watchMessages() => _remoteMessage.stream;

  Future<void> _init() async {
    settings = await messaging.requestPermission(provisional: true);
    token = await messaging.getToken();

    if (kDebugMode) {
      print('Registration Token=$token');
    }

    await _manageSubscriptions();

    /// Foreground message handler
    FirebaseMessaging.onMessage.listen(_handleForegroundMessages);

    /// Background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    /// Methods that listen for when a notification was selected
    await _checkIfAppFirstOpenedByMessage();
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageTapped);
  }

  /// In case we want to send targeted messages based on a subscription topic
  Future<void> _manageSubscriptions() async {
    const topic = 'general';
    await messaging.subscribeToTopic(topic);
  }

  void _handleForegroundMessages(RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    _remoteMessage.value = message;
  }

  /// If the app was in a terminated state and opened by a notification
  /// This will return that notification and handle it as if it was pressed
  /// Otherwise, this method does nothing
  Future<void> _checkIfAppFirstOpenedByMessage() async {
    final initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageTapped(initialMessage);
    }
  }

  /// Navigate to a message whenever it is tapped from a notification window
  /// Should work for foreground messages, background messages, and messages
  /// sent while the app was in a terminated state
  void _handleMessageTapped(RemoteMessage message) {
    if (kDebugMode) {
      print('************************************');
      print('Message TAPPED, title: ${message.notification?.title}');
      print('Message TAPPED, body: ${message.notification?.body}');
      print('************************************');
    }
    final messageId = message.messageId;
    if (messageId != null) {
      ref.read(goRouterProvider).pushNamed(
        AppRoute.messageItem.name,
        pathParameters: {'messageId': messageId},
      );
    } else {
      debugPrint('No message ID found');
    }
  }
}

@Riverpod(keepAlive: true)
FirebaseMessagingService firebaseMessagingService(
  FirebaseMessagingServiceRef ref,
) =>
    FirebaseMessagingService(ref);

@Riverpod(keepAlive: true)
Stream<RemoteMessage?> remoteMessage(RemoteMessageRef ref) =>
    ref.watch(firebaseMessagingServiceProvider).watchMessages();
