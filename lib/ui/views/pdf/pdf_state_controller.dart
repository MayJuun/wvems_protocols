import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wvems_protocols/assets.dart';

class PdfStateController extends GetxController {
  String pathPDF = '';
  String landscapePathPdf = '';
  String remotePDFpath = '';
  String corruptedPathPDF = '';

  @override
  void onInit() {
    // super.initState();
    fromAsset(AppAssets.PROTOCOL_2020, 'corrupted.pdf').then((f) {
      corruptedPathPDF = f.path;
      update();
    });
    fromAsset(AppAssets.PROTOCOL_2020, 'demo.pdf').then((f) {
      pathPDF = f.path;
      update();
    });
    fromAsset(AppAssets.PROTOCOL_2020, 'landscape.pdf').then((f) {
      landscapePathPdf = f.path;
      update();
    });
    createFileOfPdfUrl().then((f) {
      remotePDFpath = f.path;
      update();
    });
    super.onInit();
  }

  Future<File> createFileOfPdfUrl() async {
    final Completer<File> completer = Completer();
    print('Start download file from internet!');
    try {
      // 'https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf';
      // final url = 'https://pdfkit.org/docs/guide.pdf';
      const url = 'http://www.pdf995.com/samples/pdf.pdf';
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

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    final Completer<File> completer = Completer();

    try {
      final dir = await getApplicationDocumentsDirectory();
      final File file = File('${dir.path}/$filename');
      final data = await rootBundle.load(asset);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}
