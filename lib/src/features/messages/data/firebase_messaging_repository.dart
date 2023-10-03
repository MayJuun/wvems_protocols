import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'firebase_messaging_repository.g.dart';

class FirebaseMessagingRepository {
  final _remoteMessage = InMemoryStore<RemoteMessage?>(null);

  Future<RemoteMessage?> fetchLastMessage() async => _remoteMessage.value;
  Stream<RemoteMessage?> watchMessages() => _remoteMessage.stream;

  void showFlutterNotification(RemoteMessage message) {
    _remoteMessage.value = message;

    final notification = message.notification;
    final android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'notification_icon',
          ),
        ),
      );
    }
  }
}

@Riverpod(keepAlive: true)
FirebaseMessagingRepository firebaseMessagingRepository(
  FirebaseMessagingRepositoryRef ref,
) =>
    throw UnimplementedError();

@Riverpod(keepAlive: true)
Stream<RemoteMessage?> remoteMessage(RemoteMessageRef ref) =>
    ref.watch(firebaseMessagingRepositoryProvider).watchMessages();
