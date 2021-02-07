import 'dart:async';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class PdfScreenController extends GetxController {
  final Completer<PDFViewController> controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
}
