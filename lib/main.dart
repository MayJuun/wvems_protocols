import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wvems_protocols/controllers/firebase/messaging_controller.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/views/views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(MyApp());
}

Future<void> _initServices() async {
  await GetStorage.init();
  Get.put<StorageController>(StorageController());
  StorageController.to.getFirstLoadInfoFromStore();
  Get.put<ThemeController>(ThemeController());
  await ThemeController.to.getThemeModeFromStore();
  await Firebase.initializeApp();
  Get.lazyPut<ProtocolBundleController>(() => ProtocolBundleController());
  Get.lazyPut<PdfStateController>(() => PdfStateController());
  Get.lazyPut<SearchController>(() => SearchController());
  Get.putAsync<MessagingController>(() async => MessagingController());
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
    );
  }
}
