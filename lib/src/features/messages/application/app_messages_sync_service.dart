import 'package:collection/collection.dart';
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
      }
      //
    });
  }

  Future<void> handleMessageOpened(RemoteMessage message) async {
    final messageId = message.messageId;

    if (messageId == null) {
      const error = 'Error: no message ID available in this notification';
      debugPrint(error);
    } else {
      final messages = await _resetSavedMessages();

      try {
        final savedMessage = messages.singleWhereOrNull(
          (e) => e.messageId == messageId,
        );
        if (savedMessage != null) {
          await ref.read(appMessagesRepositoryProvider).toggleRead(messageId);

          await ref.read(goRouterProvider).pushNamed(
            AppRoute.messageItem.name,
            pathParameters: {'messageId': messageId},
          );
        } else {
          throw StateError('Error: Message not found');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> handleAppResumed() async {
    debugPrint('Resuming app, reloading messages');
    await _resetSavedMessages();
  }

  Future<List<AppMessage>> _resetSavedMessages() async {
    await ref.read(sharedPreferencesRepositoryProvider).reload();
    final newMessages =
        ref.read(sharedPreferencesRepositoryProvider).getAppMessages();

    await ref.read(appMessagesRepositoryProvider).setMessages(newMessages);
    return newMessages;
  }
}

@Riverpod(keepAlive: true)
AppMessagesSyncService appMessagesSyncService(AppMessagesSyncServiceRef ref) =>
    AppMessagesSyncService(ref);
