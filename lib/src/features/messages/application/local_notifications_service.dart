import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'local_notifications_service.g.dart';

/// Relevant only if you're able to get Notification actions to work
///
/// https://pub.dev/packages/flutter_local_notifications#notification-actions
///
///
// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   // ignore: avoid_print
//   print('notification(${notificationResponse.id}) action tapped: '
//       '${notificationResponse.actionId} with'
//       ' payload: ${notificationResponse.payload}');
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     // ignore: avoid_print
//     print(
//       'notification action tapped with input: ${notificationResponse.input}',
//     );
//   }
// }

class LocalNotificationsService {
  LocalNotificationsService(this.ref) {
    _init();
  }

  final Ref ref;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // final StreamController<String?> selectNotificationStream =
  //     StreamController<String?>.broadcast();
  // final MethodChannel platform =
  //     const MethodChannel('dexterx.dev/flutter_local_notifications_example');
  // final String portName = 'notification_send_port';

  String? selectedNotificationPayload;

  Future<void> _init() async {
    // await _configureLocalTimeZone();
    // await _handleAppLaunch();

    await flutterLocalNotificationsPlugin.initialize(
      localNotificationsSettings,
      onDidReceiveNotificationResponse: _handleNotificationResponse,
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  // Future<void> _handleAppLaunch() async {
  //   final notificationAppLaunchDetails = !kIsWeb && Platform.isLinux
  //       ? null
  //       : await flutterLocalNotificationsPlugin
  //           .getNotificationAppLaunchDetails();
  //   if (notificationAppLaunchDetails != null &&
  //       notificationAppLaunchDetails.didNotificationLaunchApp) {
  //     debugPrint('App launch received in this notification');

  //     final notificationResponse =
  //         notificationAppLaunchDetails.notificationResponse;
  //     if (notificationResponse != null) {
  //       await _navigateToMessageInfo(notificationResponse);
  //     } else {
  //     throw StateError('No Notification Response to handle on app startup');
  //     }
  //   }
  // }

  /// Currently, this only handles Android (foreground) onTap events
  /// All other messages handled by FirebaseMessaging
  void _handleNotificationResponse(NotificationResponse notificationResponse) {
    /// you can technically set up navigation actions...
    /// https://pub.dev/packages/flutter_local_notifications#notification-actions
    /// ... but I haven't found an easy way for that to work.
    ///
    if (!Platform.isAndroid) {
      debugPrint(
        'handleResponse only used for Android (foreground) messages.',
      );
      return;
    }
    _navigateToMessageInfo(notificationResponse);
  }

  /// Currently, this only handles Android messages (foreground)
  /// All other messages handled by FirebaseMessaging
  Future<void> showNotification(AppMessage message) async {
    if (!Platform.isAndroid) {
      debugPrint(
        'showNotification only used for Android (foreground) messages.',
      );
      return;
    }

    /// Placeholder in case we want to set up custom navigation buttons
    ///
    // final navigationActions = (message.data['action'] == 'NAVIGATE')
    //     ? [
    //         AndroidNotificationAction(
    //           NotificationActions.navigateAction.actionId,
    //           NotificationActions.navigateAction.title,
    //           showsUserInterface: true,
    //         ),
    //       ]
    //     : null;

    const androidNotificationDetails = AndroidNotificationDetails(
      'wvems-protocols',
      'WVEMS Protocols',
      channelDescription: 'General updates and messages',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      // actions: navigationActions,
    );
    const notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      message.randomId,
      message.title,
      message.body,
      notificationDetails,
      payload: message.payload.toString(),
    );
  }

  Future<void> _navigateToMessageInfo(
    NotificationResponse notificationResponse,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    final sharedPreferencesRepository = SharedPreferencesRepository(prefs);
    final appMessages = sharedPreferencesRepository.getAppMessages();

    final appMessage = appMessages
        .singleWhereOrNull((e) => e.randomId == notificationResponse.id);
    if (appMessage != null) {
      await _navigateToAppMessage(appMessage.messageId);
    } else {
      debugPrint('Error: Message not found');
    }
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
          await _navigateToAppMessage(messageId);
        } else {
          throw StateError('Error: Message not found');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> _navigateToAppMessage(MessageId messageId) async {
    await ref
        .read(appMessagesRepositoryProvider)
        .toggleRead(messageId, isRead: true);

    await ref.read(goRouterProvider).pushNamed(
      AppRoute.messageItem.name,
      pathParameters: {'messageId': messageId},
    );
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
LocalNotificationsService localNotificationsService(
  LocalNotificationsServiceRef ref,
) {
  return LocalNotificationsService(ref);
}
