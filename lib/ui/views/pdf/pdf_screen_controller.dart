import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class PdfScreenController extends GetxController with WidgetsBindingObserver {
  final Completer<PDFViewController> controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  /// Unique Key required for screen layout changes in Android
  /// More details about this bug and its solution available here
  /// https://github.com/endigo/flutter_pdfview/issues/9#issuecomment-621162440
  UniqueKey pdfViewerKey = UniqueKey();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    if (Platform.isAndroid) {
      Future.delayed(
        const Duration(milliseconds: 250),
        () {
          pdfViewerKey = UniqueKey();
          update();
        },
      );
    }
  }

  /// Methods used for PDFView
  void onPdfRender(int newPage) {
    pages = newPage;
    isReady = true;
    update();
  }

  void onPdfError(dynamic error) {
    errorMessage = error.toString();
    update();
    print(error.toString());
  }

  void onPdfPageError(int page, dynamic error) {
    errorMessage = '$page: ${error.toString()}';
    update();
    print('$page: ${error.toString()}');
  }

  void onPdfViewCreated(PDFViewController pdfViewController) {
    // todo: this still fails on hot reload
    if (currentPage != null) {
      pdfViewController.setPage(currentPage);
    }
    if (!controller.isCompleted) {
      controller.complete(pdfViewController);
    }
  }

  void onPdfLinkHandler(String uri) {
    print('goto uri: $uri');
  }

  void onPdfPageChanged(int page, int total) {
    print('page change: $page/$total');
    currentPage = page;
    update();
  }
}
