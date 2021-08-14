import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';

class MessagingController extends GetxController {
  final StorageController storageController = Get.find();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late NotificationSettings settings;
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  late final RxSet<AppMessage> appMessages;

  bool hasNewMessage() {
    final newMessageList = appMessages.where((element) => !element.beenRead);
    return newMessageList.isNotEmpty;
  }

  void toggleRead(AppMessage appMessage) {
    appMessages.remove(appMessage);
    appMessages.add(
      appMessage.copyWith(beenRead: !appMessage.beenRead),
    );
    saveMessagesToStore();
  }

  void removeMessage(AppMessage appMessage) {
    Get.defaultDialog(
      title: 'Delete message?',
      middleText: 'Are you sure you want to delete this message?',
      textConfirm: 'DELETE',
      onConfirm: () {
        Get.back();
        appMessages.remove(appMessage);
      },
      onCancel: () => Get.back(),
    );
  }

  /// *************** Initialize Class and necessary values ****************///
  @override
  Future<void> onInit() async {
    super.onInit();

    appMessages = await _loadMessagesFromStore();

    settings = await _requestPermissions();
    await _createNotificationChannel();

    // spec: https://firebase.flutter.dev/docs/messaging/notifications#ios-configuration
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    setupInteractedMessage();
  }

  Future<RxSet<AppMessage>> _loadMessagesFromStore() async {
    final Map<String, dynamic> storeMessages =
        storageController.store.read('messages') ?? {};
    final RxSet<AppMessage> newSet = <AppMessage>{}.obs;
    if (storeMessages.isNotEmpty) {
      // first, convert all messages to JSON prior to storing
      final tempMessagesSet = <AppMessage>{};
      storeMessages.forEach(
        (key, value) => tempMessagesSet.add(AppMessage.fromJson(value)),
      );
      newSet.addAll(tempMessagesSet);
      print('$newSet');
    }
    return newSet;

    // await saveMessagesToStore();
  }

  Future<void> saveMessagesToStore() async {
    // first, convert all messages to JSON prior to storing
    final messagesAsJson = <String, dynamic>{};
    appMessages.forEach((e) {
      messagesAsJson[e.title] = e.toJson();
    });
    await storageController.store.write('messages', messagesAsJson);
  }

  // Future<void> listen() async {
  //   FirebaseMessaging.onMessage.listen(
  //     (RemoteMessage message) async {
  //       final RemoteNotification? notification = message.notification;
  //       final AndroidNotification? android = message.notification?.android;

  //       // If `onMessage` is triggered with a notification, construct our own
  //       // local notification to show to users using the created channel.
  //       if (notification != null && android != null) {
  //         flutterLocalNotificationsPlugin.show(
  //             notification.hashCode,
  //             notification.title,
  //             notification.body,
  //             NotificationDetails(
  //               android: AndroidNotificationDetails(
  //                 channel.id,
  //                 channel.name,
  //                 channel.description,
  //                 icon: 'ic_launcher',
  //               ),
  //             ));
  //       }
  //     },
  //   );
  // }

  /// spec: https://firebase.flutter.dev/docs/messaging/notifications#handling-interaction
  /// It is assumed that all messages contain a data field with the key 'type'
  ///
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    final RemoteMessage? initialMessage =
        await messaging.getInitialMessage().then((initMessage) {
      if (initMessage != null) {
        handleMessage(initMessage);
      }
    });

    // Handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessage
        .listen((RemoteMessage message) async => handleMessage(message));

    // todo: is this stream necessary?
    // it's shown here https://firebase.flutter.dev/docs/messaging/notifications#handling-interaction
    // ...but doesn't seem to work as intended
    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage message) async => handleMessage(message));
  }

  Future<void> handleMessage(RemoteMessage message) async {
    final RemoteNotification? notification = message.notification;
    final AndroidNotification? android = message.notification?.android;

    if (notification != null) {
      // todo: handle messages here
      print(
          'NOTIFICATION RECEIVED  title: ${notification.title} body: ${notification.body}');
      appMessages.add(
        AppMessage(
          title: notification.title ?? '',
          body: notification.body ?? '',
          dateTime: DateTime.now(),
          beenRead: false,
        ),
      );
      await saveMessagesToStore();
    }

    /// Android only
    ///
    /// If `onMessage` is triggered with a notification, construct our own
    /// local notification to show to users using the created channel.
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              icon: 'ic_launcher',
            ),
          ));
    }
  }

  /// ************* Initialize Class and necessary values ***************///
  Future<NotificationSettings> _requestPermissions() async =>
      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

  Future<void> _createNotificationChannel() async =>
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

  AuthorizationStatus getAuthStatus() {
    final authStatus = settings.authorizationStatus;
    if (authStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (authStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
    return authStatus;
  }
}

// format of app message as JSON:   {AppMessage(title: Message Title, dateTime: 2021-07-25 20:14:09.492419, body: Notification text goes here, beenRead: false)}