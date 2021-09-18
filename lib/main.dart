import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    );
  }
}
