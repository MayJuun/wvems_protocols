import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'firebase_messaging_service.g.dart';

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
  // onMessageAdded(message);
}

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

  // ignore: use_setters_to_change_properties
  void _addMessage(RemoteMessage remoteMessage) =>
      _remoteMessage.value = remoteMessage;

  Future<void> _init() async {
    settings = await messaging.requestPermission();
    token = await messaging.getToken();

    const topic = 'app_promotion';
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
