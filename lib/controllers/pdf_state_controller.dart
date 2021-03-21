import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/services/services.dart';

class PdfStateController extends GetxController with WidgetsBindingObserver {
  /// Used to load current, active PDF via file or web
  final PdfService _pdfService = PdfService();

  /// Used to determine if the file has been loaded or not, and keep state
  final Rx<PdfFileState> pdfFileState = const PdfFileState.loading().obs;

  /// Used to parse all text of the currently active file, when necessary
  final Rx<PdfDocState> pdfDocState = const PdfDocState.loading().obs;
  final RxList<String> pdfTextList = <String>[].obs;

  /// Recent search history for this app, stored locally
  // todo: connect pdfSearchHistory to GetStorage
  final PdfSearchHistory pdfSearchHistory = PdfSearchHistory();

  /// Used for PDFView
  Completer<PDFViewController> asyncController = Completer<PDFViewController>();
  Rx<PDFViewController> rxPdfController;

  final pages = 0.obs;
  final currentPage = 0.obs;
  final isReady = false.obs;
  final errorMessage = ''.obs;
  String pathPDF = '';

  Orientation currentOrientation = Get.context.orientation;

  /// Unique Key required for screen layout changes in Android
  /// More details about this bug and its solution available here
  /// https://github.com/endigo/flutter_pdfview/issues/9#issuecomment-621162440
  UniqueKey pdfViewerKey = UniqueKey();

  /// **********************************************************
  /// *************** PDF FILE STATE METHODS *******************
  /// **********************************************************

  Future<void> loadNewPdf(String assetPath) async {
    pdfFileState.value = const PdfFileState.loading();
    try {
      final newFile = await _updatePdfFromAsset(assetPath);
      if (newFile != null) {
        /// First, save newly loaded file under PdfFileState
        pdfFileState.value = PdfFileState.data(newFile);

        /// Then, check and see if pdfDoc / text need to be updated
        /// This is an expensive operation, so it should only happen if necessary
        _loadNewPdfText();
        print('file saved');
      } else {
        pdfFileState.value = PdfFileState.error(
            'Error: File asset path is empty', StackTrace.current);
      }
    } catch (e, s) {
      pdfFileState.value = PdfFileState.error(e, s);
    }
  }

  Future<File> _updatePdfFromAsset(String assetPath) async {
    print('loading pdfs...');
    File newValue;
    _pdfService.fromAsset(assetPath, 'active.pdf').then((f) {
      pathPDF = f.path;
      if (f != null) {
        pdfFileState.value = PdfFileState.data(f);
      }

      print('pdf loaded: ${f.path}');
      newValue = f;
      _resetPdfUI();
    });

    await _createNewPdfController();

    return newValue;
  }

  void _resetPdfUI() {
    // set new UniqueKey, which triggers a UI redraw
    // UniqueKey is most important w/ Android redraws
    pdfViewerKey = UniqueKey();
    currentPage.value = 0;
  }

  /// **********************************************************
  /// ************ PDF CONTROLLER CONFIG METHODS ***************
  /// **********************************************************

  Future<bool> _createNewPdfController() async {
    final newController = await complete();
    _setOrResetRxPdfController(newController);
    update();
    return true;
  }

  void _setOrResetRxPdfController(PDFViewController newController) {
    asyncController = Completer<PDFViewController>();
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
  /// *************** PDF TEXT STATE METHODS *******************
  /// **********************************************************

  Future<void> _loadNewPdfText() async {
    // final newPdfDoc = await PDFDoc.fromFile(newFile);
    // pdfDocState.value = PdfDocState.data(newPdfDoc);
  }
  //  Future<List<String>> getPDFtextPaginated(String path) async {
  //   List<String> textList = <String>[];
  //   try {
  //     textList = await ReadPdfText.getPDFtextPaginated(path);
  //   } on PlatformException {}
  //   return textList;
  // }

  /// **********************************************************
  /// ****************** OVERRIDEN METHODS *********************
  /// **********************************************************

  @override
  void onInit() {
    super.onInit();
    // Used for first load of embedded PDF
    loadNewPdf(AppAssets.PROTOCOL_2020);

    // Used for Android layout changes
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  Future<void> didChangeMetrics() async {
    if (Platform.isAndroid) {
      final newOrientation = Get.context.orientation;

      // only trigger a redraw if the orientation changes
      if (newOrientation != currentOrientation) {
        await Future.delayed(
          const Duration(milliseconds: 200),
          () async {
            // create new unique key, which triggers a new instance of PdfView
            pdfViewerKey = UniqueKey();
            // todo: close original controller, otherwise error
            // W/System  (12745): A resource failed to call release
            // todo: occasionally, this will not redraw on portrait/landscape swap
            // this new instance of PdfView needs to be tied to a new controller
            await _createNewPdfController();
            currentOrientation = newOrientation;
            update();
          },
        );
      }
    }
  }

  /// **********************************************************
  /// ******************* PDF VIEW METHODS *********************
  /// **********************************************************

  void onPdfRender(int newPage) {
    pages.value = newPage;
    isReady.value = true;
    update();
  }

  void onPdfError(dynamic error) {
    errorMessage.value = error.toString();
    update();
    print(error.toString());
  }

  void onPdfPageError(int page, dynamic error) {
    errorMessage.value = '$page: ${error.toString()}';
    update();
    print('$page: ${error.toString()}');
  }

  void onPdfViewCreated(PDFViewController pdfViewController) {
    // todo: this still fails on hot reload
    if (currentPage != null) {
      pdfViewController.setPage(currentPage.value);
    }
    if (!asyncController.isCompleted) {
      asyncController.complete(pdfViewController);
    }
  }

  void onPdfLinkHandler(String uri) {
    print('goto uri: $uri');
  }

  void onPdfPageChanged(int page, int total) {
    /// Interestingly, iOS calls this method twice on handling internal hyperlinks
    /// Android does not. It only calls this method once
    print('page change: $page/$total');
    currentPage.value = page;
    update();
  }
}
