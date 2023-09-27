import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/src/features/messages/data/remote_message_repository.dart';

part 'firebase_messaging_service.g.dart';

class FirebaseMessagingService {
  FirebaseMessagingService(this.ref) {
    _init();
  }

  final Ref ref;
  final messaging = FirebaseMessaging.instance;
  late final NotificationSettings settings;
  late final String? token;

  Future<void> _init() async {
    settings = await messaging.requestPermission();
    token = await messaging.getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification?.title}');
        print('Message notification: ${message.notification?.body}');
      }

      ref.read(remoteMessageRepositoryProvider).addMessage(message);
    });
  }
}

@Riverpod(keepAlive: true)
Stream<RemoteMessage?> remoteMessage(RemoteMessageRef ref) =>
    ref.watch(remoteMessageRepositoryProvider).watchMessage();
