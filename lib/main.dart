import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wvems_protocols/controllers/commands/messaging_controller.dart';
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
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // todo: implement error page
          return const Center(
            child: Text('ERROR!'),
          );
        }

        // Once complete, show your application
        else if (snapshot.connectionState == ConnectionState.done) {
          Get.put<MessagingController>(MessagingController());
          return GetMaterialApp(
            theme: ThemeController.to.lightTheme.themeData,
            darkTheme: ThemeController.to.darkTheme.themeData,
            themeMode: ThemeController.to.themeMode,
            home: HomeScreen(),
          );
        } else {
          // Otherwise, show something whilst waiting for initialization to complete
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
