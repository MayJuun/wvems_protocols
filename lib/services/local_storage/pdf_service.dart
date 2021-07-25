import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wvems_protocols/models/models.dart';

class PdfService {
  Future<File> createFileOfPdfUrl() async {
    final Completer<File> completer = Completer();
    print('Start download file from internet!');
    try {
      // todo: replace with actual url, when relevant
      const url = 'URL_GOES_HERE';
      final filename = url.substring(url.lastIndexOf('/') + 1);
      final request = await HttpClient().getUrl(Uri.parse(url));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);
      final dir = await getApplicationDocumentsDirectory();
      print('Download files');
      print('${dir.path}/$filename');
      final File file = File('${dir.path}/$filename');

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<File> loadFileFromAsset(String assetPath, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    final Completer<File> completer = Completer();

    try {
      final dir = await getApplicationDocumentsDirectory();
      final String fullPath = '${dir.path}/$filename';

      late final File file;

      if (File(fullPath).existsSync()) {
        file = File(fullPath);
      } else {
        file = await File(fullPath).create(recursive: true);
      }

      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<File> loadFileFromBundle(ProtocolBundleAsFiles bundle) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    final Completer<File> completer = Completer();

    try {
      final File file = bundle.pdfFile;
      final Uint8List bytes = await bundle.pdfFile.readAsBytes();
      // final ByteData data = bytes.buffer.asByteData();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}
