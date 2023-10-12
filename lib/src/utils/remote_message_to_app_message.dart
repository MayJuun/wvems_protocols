import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:uuid/uuid.dart';
import 'package:wvems_protocols/src/features/messages/domain/app_message.dart';

const _randomMax = 999999999;

AppMessage remoteMessageToAppMessage(RemoteMessage remoteMessage) {
  final payload = remoteMessage.data;

  return AppMessage(
    messageId: remoteMessage.messageId ?? const Uuid().toString(),
    randomId: Random().nextInt(_randomMax),
    title: remoteMessage.notification?.title ?? '',
    body: remoteMessage.notification?.body ?? '',
    payload: payload.isEmpty ? null : payload,
    dateTime: remoteMessage.sentTime ?? DateTime.now(),
  );
}
