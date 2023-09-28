import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'firebase_messaging_service.g.dart';

/// This background handler occurs outside of the normal app isolate
/// Thus, any new message should be stored locally in sharedPreferences
/// It will be shown on the next app reload.
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
  FirebaseMessagingService() {
    _init();
  }

  final messaging = FirebaseMessaging.instance;
  late final NotificationSettings settings;
  late final String? token;

  final _remoteMessage = InMemoryStore<RemoteMessage?>(null);

  Future<RemoteMessage?> fetchLastMessage() async => _remoteMessage.value;

  Stream<RemoteMessage?> watchMessages() => _remoteMessage.stream;

  Future<void> _init() async {
    settings = await messaging.requestPermission();
    token = await messaging.getToken();

    // if (kDebugMode) {
    //   print('Registration Token=$token');
    // }

    const topic = 'general';
    await messaging.subscribeToTopic(topic);

    /// Foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification?.title}');
        print('Message notification: ${message.notification?.body}');
      }

      _remoteMessage.value = message;
    });

    /// Background message handler
    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler,
    );
  }
}

@Riverpod(keepAlive: true)
FirebaseMessagingService firebaseMessagingService(
  FirebaseMessagingServiceRef ref,
) =>
    FirebaseMessagingService();

@Riverpod(keepAlive: true)
Stream<RemoteMessage?> remoteMessage(RemoteMessageRef ref) =>
    ref.watch(firebaseMessagingServiceProvider).watchMessages();
