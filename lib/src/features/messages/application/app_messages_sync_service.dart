import 'package:firebase_messaging/firebase_messaging.dart';
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
      final message = next.value;
      if (message != null) {
        /// display new message as a notification
        // TODO(FireJuun): display notification

        /// save new message locally
        final appMessage = AppMessage(
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

@Riverpod(keepAlive: true)
Stream<List<AppMessage>> appMessages(AppMessagesRef ref) =>
    ref.watch(appMessagesRepositoryProvider).watchMessages();
