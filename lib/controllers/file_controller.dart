import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FileController extends GetxController {
  final _assetPath = ''.obs;
  String get path => _assetPath.value;
  set path(String newPath) => _assetPath.value = newPath;

  @override
  Future<void> onInit() async {
    await loadNewFile('assets/pdf/wvems-protocols-2019.pdf');
    super.onInit();
  }

  Future<void> loadNewFile(String path) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/protocol.pdf');
      final data = await rootBundle.load(path);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      _assetPath.value = '${dir.path}/protocol.pdf';
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
  }
}
