import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
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
      final message = next.value;
      // from docs
      if (message != null && message.notification != null) {
        final lastMessage = 'Received a notification message:'
            '\nTitle=${message.notification?.title},'
            '\nBody=${message.notification?.body},'
            '\nData=${message.data}';
        debugPrint(lastMessage);
      } else {
        final lastMessage = 'Received a data message: ${message?.data}';
        debugPrint(lastMessage);
      }

      if (message != null) {
        /// display new message as a notification
        // TODO(FireJuun): display notification

        /// save new message locally
        final appMessage = AppMessage(
          messageId: message.messageId ?? const Uuid().toString(),
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          dateTime: message.sentTime ?? DateTime.now(),
        );
        ref.read(appMessagesRepositoryProvider).addMessage(appMessage);
      }
      //
    });
  }
}

@Riverpod(keepAlive: true)
AppMessagesSyncService appMessagesSyncService(AppMessagesSyncServiceRef ref) =>
    AppMessagesSyncService(ref);
