import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'app_messages_sync_service.g.dart';

/// Listens for new messages that are sent via Firebase
/// messaging, then stores them as part of the AppMessages list
/// for later retrieval and modifications (mark read, delete, etc).
class AppMessagesSyncService {
  AppMessagesSyncService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen<AsyncValue<RemoteMessage?>>(remoteMessageProvider,
        (previous, next) {
      final remoteMessage = next.value;
      // from docs
      if (remoteMessage != null && remoteMessage.notification != null) {
        final lastMessage = 'Received a notification message:'
            '\nTitle=${remoteMessage.notification?.title},'
            '\nBody=${remoteMessage.notification?.body},'
            '\nData=${remoteMessage.data}';
        debugPrint(lastMessage);
      } else {
        final lastMessage = 'Received a data message: ${remoteMessage?.data}';
        debugPrint(lastMessage);
      }

      if (remoteMessage != null) {
        final appMessage = remoteMessageToAppMessage(remoteMessage);

        /// save new message locally
        ref.read(appMessagesRepositoryProvider).addMessage(appMessage);

        /// display new message as a notification
        ref
            .read(localNotificationsServiceProvider)
            .showNotification(appMessage);
      }
      //
    });
  }
}

@Riverpod(keepAlive: true)
AppMessagesSyncService appMessagesSyncService(AppMessagesSyncServiceRef ref) =>
    AppMessagesSyncService(ref);
