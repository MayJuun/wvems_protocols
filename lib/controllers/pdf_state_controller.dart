import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/services/services.dart';

class PdfStateController extends GetxController with WidgetsBindingObserver {
  /// Used to load current, active PDF via file or web
  final PdfService _pdfService = PdfService();

  /// Used to determine if the file has been loaded or not, and keep state
  final Rx<PdfFileState> pdfFileState = const PdfFileState.loading().obs;

  /// Used to parse all text of the currently active file, when necessary
  final Rx<PdfTextListState> pdfTextListState =
      const PdfTextListState.loading().obs;

  /// Used for PDFView
  Completer<PDFViewController> asyncController = Completer<PDFViewController>();
  Rx<PDFViewController>? rxPdfController;

  final pages = 0.obs;
  final currentPage = 0.obs;
  final isReady = false.obs;
  final errorMessage = ''.obs;
  String pathPDF = '';

  Orientation? currentOrientation = Get.context?.orientation;

  /// Unique Key required for screen layout changes in Android
  /// More details about this bug and its solution available here
  /// https://github.com/endigo/flutter_pdfview/issues/9#issuecomment-621162440
  UniqueKey pdfViewerKey = UniqueKey();

  /// **********************************************************
  /// *************** PDF FILE STATE METHODS *******************
  /// **********************************************************

  Future<void> loadNewPdf(String assetPath) async {
    print('load new pdf');
    pdfFileState.value = const PdfFileState.loading();
    try {
      final newFile = await _updatePdfFromAsset(assetPath);
      print('returned');

      /// First, save newly loaded file under PdfFileState
      pdfFileState.value = PdfFileState.data(newFile);

      /// Then, find/load the JSON file that contains all text
      _loadNewPdfText(AssetsUtil().pdfToJson(assetPath));
      print('file saved');
    } catch (e, st) {
      pdfFileState.value = PdfFileState.error(e, st);
    }
  }

  // ToDo: make sure this flow is correct
  Future<File> _updatePdfFromAsset(String assetPath) async {
    print('loading pdfs...');
    final f = await _pdfService.fromAsset(assetPath, 'active.pdf');
    pathPDF = f.path;
    print('pdf loaded: $pathPDF');
    _resetPdfUI();
    _createNewPdfController();
    return f;
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
    asyncController = Completer<PDFViewController>();
    final newController = asyncController.future;
    await _setOrResetRxPdfController(newController);
    return true;
  }

  Future<void> _setOrResetRxPdfController(
      Future<PDFViewController> newController) async {
    if (rxPdfController != null) {
      rxPdfController!.value = await newController;
    } else {
      rxPdfController = (await newController).obs;
    }
  }

  /// This methods establishes the PDFViewController on first load
  /// If the active pdf ever changes...
  /// This completer will re-run to reset the controller
  /// todo: verify if this controller needs/takes a dispose() method

  /// **********************************************************
  /// *************** PDF TEXT STATE METHODS *******************
  /// **********************************************************

  Future<void> _loadNewPdfText(String assetPath) async {
    pdfTextListState.value = const PdfTextListState.loading();

    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final textList = jsonDecode(jsonString);
      pdfTextListState.value = PdfTextListState.data(textList);
      print('pdf text loaded');
    } catch (e, st) {
      pdfTextListState.value = PdfTextListState.error(e, st);
    }
  }

  /// **********************************************************
  /// ****************** OVERRIDEN METHODS *********************
  /// **********************************************************

  @override
  Future<void> onInit() async {
    super.onInit();
    // Used for first load of embedded PDF
    await loadNewPdf(AppAssets.PROTOCOL_2020);

    // Used for Android layout changes
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.onClose();
  }

  @override
  Future<void> didChangeMetrics() async {
    if (Platform.isAndroid) {
      final newOrientation = Get.context?.orientation;

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
            currentOrientation = newOrientation ?? currentOrientation;
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
    pdfViewController.setPage(currentPage.value);

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
