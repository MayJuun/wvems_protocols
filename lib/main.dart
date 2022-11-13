import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/firebase_options.dart';
import 'package:wvems_protocols/ui/views/views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _initServices();

  Get.put<MessagingController>(MessagingController());
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

// spec: https://firebase.flutter.dev/docs/messaging/usage
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print('Handling a background message: ${message.messageId}');
  final MessagingController messagingController = Get.find();
  await messagingController.handleMessage(message);
}

Future<void> _initServices() async {
  await GetStorage.init();
  Get.put<StorageController>(StorageController());
  StorageController.to.getFirstLoadInfoFromStore();
  Get.put<ThemeController>(ThemeController());
  await ThemeController.to.getThemeModeFromStore();
  await Firebase.initializeApp();
  Get.put<PdfStateController>(PdfStateController());
  Get.put<ProtocolBundleController>(ProtocolBundleController());
  Get.putAsync<SearchController>(() async => SearchController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return GetMaterialApp(
      theme:
          themeController.getThemeDataFromThemeMode(themeController.themeMode),
      themeMode: themeController.themeMode,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
