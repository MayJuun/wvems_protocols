import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/file_controller.dart';
import 'package:wvems_protocols/controllers/search_controller.dart';

import 'display_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(FileController());
  // Get.put(SearchController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DisplayScreen(),
    );
  }
}
