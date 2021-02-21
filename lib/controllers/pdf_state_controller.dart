import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/services/services.dart';

class PdfStateController extends GetxController with WidgetsBindingObserver {
  /// Used to manage state of the current, active PDF
  final PdfService _pdfService = PdfService();
  final Rx<Pdf> pdfState = const Pdf.loading().obs;

  /// Used for PDFView
  final Completer<PDFViewController> asyncController =
      Completer<PDFViewController>();
  Rx<PDFViewController> rxPdfController;

  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  String pathPDF = '';

  /// Unique Key required for screen layout changes in Android
  /// More details about this bug and its solution available here
  /// https://github.com/endigo/flutter_pdfview/issues/9#issuecomment-621162440
  UniqueKey pdfViewerKey = UniqueKey();

  /// **********************************************************
  /// ******************* CUSTOM METHODS **********************
  /// **********************************************************

  Future<void> loadNewPdf(String assetPath) async {
    pdfState.value = const Pdf.loading();
    final newValue = await _updatePdfFromAsset(assetPath);

    if (newValue != null) {
      pdfState.value = Pdf.data(newValue);
    }
  }

  Future<File> _updatePdfFromAsset(String assetPath) async {
    print('loading pdfs...');
    File newValue;
    _pdfService.fromAsset(assetPath, 'active.pdf').then((f) {
      pathPDF = f.path;
      if (f != null) {
        pdfState.value = Pdf.data(f);
      }

      print('pdf loaded: ${f.path}');
      newValue = f;
      _resetPdfUI();
    });

    final newController = await complete();
    setOrResetRxPdfController(newController);
    update();
    return newValue;
  }

  void _resetPdfUI() {
    // set new UniqueKey, which triggers a UI redraw
    pdfViewerKey = UniqueKey();
    currentPage = 0;
  }

  void setOrResetRxPdfController(PDFViewController newController) {
    if (rxPdfController != null) {
      rxPdfController.value = newController;
    } else
      rxPdfController = newController.obs;
  }

  /// This methods establishes the PDFViewController on first load
  /// If the active pdf ever changes...
  /// This completer will re-run to reset the controller
  /// todo: verify if this controller needs/takes a dispose() method
  Future<PDFViewController> complete() async {
    final newController = await asyncController.future;
    return newController;
  }

  /// **********************************************************
  /// ****************** OVERRIDEN METHODS *********************
  /// **********************************************************

  @override
  void onInit() {
    super.onInit();
    // Used for first load of embedded PDF
    _updatePdfFromAsset(AppAssets.PROTOCOL_2020);

    // Used for Android layout changes
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

  /// **********************************************************
  /// ******************* PDF VIEW METHODS *********************
  /// **********************************************************

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
    if (!asyncController.isCompleted) {
      asyncController.complete(pdfViewController);
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
