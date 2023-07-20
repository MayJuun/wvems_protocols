import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/services/services.dart';
import 'package:wvems_protocols/ui/strings.dart';

class PdfStateController extends GetxController with WidgetsBindingObserver {
  /// Used to load current, active PDF via file or web
  final PdfService _pdfService = PdfService();

  /// Used to determine if the file has been loaded or not, and keep state
  final Rx<PdfFileState> pdfFileState = const PdfFileState.loading().obs;

  /// Used to parse all text of the currently active file, when necessary
  final Rx<PdfTextListState> pdfTextListState =
      const PdfTextListState.loading().obs;

  /// Parses the title for each page, which is displayed in search
  final Rx<PdfTableOfContentsState> pdfTableOfContentsState =
      const PdfTableOfContentsState.loading().obs;

  /// Used for PDFView
  PDFViewController? pdfController;

  final pages = 0.obs;
  final currentPage = 0.obs;
  final isReady = false.obs;
  final errorMessage = ''.obs;
  String pathPDF = '';
  final RxString asset = ''.obs;
  final RxInt activeYear = 2020.obs;

  Orientation? currentOrientation = Get.context?.orientation;

  /// Unique Key required for screen layout changes in Android
  /// More details about this bug and its solution available here
  /// https://github.com/endigo/flutter_pdfview/issues/9#issuecomment-621162440
  UniqueKey pdfViewerKey = UniqueKey();

  /// **********************************************************
  /// *************** PDF FILE STATE METHODS *******************
  /// **********************************************************

  Future<void> loadNewPdf(ProtocolBundleAsFiles bundle) async {
    print('load new pdf');
    pdfFileState.value = const PdfFileState.loading();
    try {
      /// First, save newly loaded file under PdfFileState
      final newFile = await _updatePdfFromBundle(bundle);
      pdfFileState.value = PdfFileState.data(newFile);
      print(bundle.pdfFile);

      /// Then, find/load the JSON file that contains all text
      await _loadNewPdfTextFromBundle(bundle);
      await _loadNewPdfTableOfContentsFromBundle(bundle);
      print('file saved');
      PdfSearchController.to.clear();
      activeYear.value = bundle.year;
    } catch (e, st) {
      pdfFileState.value = PdfFileState.error(e, st);
    }
  }

  // todo: is this method necessary?
  Future<File> _updatePdfFromBundle(ProtocolBundleAsFiles bundle) async {
    print('loading pdfs...');
    // final String assetFilename = AssetsUtil().assetToFilename(assetPath);
    final f = await _pdfService.loadFileFromBundle(bundle);
    pathPDF = f.path;
    print('pdf loaded: $pathPDF');
    resetPdfUI();
    return f;
  }

  void resetPdfUI({bool goHome = true}) {
    // set new UniqueKey, which triggers a UI redraw
    // UniqueKey is most important w/ Android redraws
    pdfViewerKey = UniqueKey();
    if (goHome) {
      currentPage.value = 0;
    }
  }

  /// **********************************************************
  /// *************** PDF TEXT STATE METHODS *******************
  /// **********************************************************

  Future<void> _loadNewPdfTextFromBundle(ProtocolBundleAsFiles bundle) async {
    pdfTextListState.value = const PdfTextListState.loading();

    try {
      final jsonString = await bundle.jsonFile.readAsString();
      final textList = jsonDecode(jsonString);
      pdfTextListState.value = PdfTextListState.data(textList);
      print('pdf text loaded');
    } catch (e, st) {
      pdfTextListState.value = PdfTextListState.error(e, st);
    }
  }

  Future<void> _loadNewPdfTableOfContentsFromBundle(
      ProtocolBundleAsFiles bundle) async {
    pdfTableOfContentsState.value = const PdfTableOfContentsState.loading();

    try {
      final jsonString = await bundle.tocJsonFile.readAsString();
      final Map<String, dynamic> textList = jsonDecode(jsonString);
      pdfTableOfContentsState.value = PdfTableOfContentsState.data(textList);
      print('pdf table of contents loaded');
      // after loading this content, parse new data to update the theme
      // if no data, use the 2019 default colors instead
      final String unparsedColor =
          textList['primaryColor'] ?? S.DEFAULT_PRIMARY_COLOR;
      final Color primaryColor = Color(_parseColorStringToHex(unparsedColor));
      ThemeController.to.setThemeColorsFromPdfData(primaryColor);
    } catch (e, st) {
      pdfTableOfContentsState.value = PdfTableOfContentsState.error(e, st);
    }
  }

  // does this need error handling, in case the string is listed incorrectly?
  int _parseColorStringToHex(String colorString) =>
      int.parse(colorString, radix: 16) + 0xFF000000;

  String getTableOfContentsFromPageNum(int pageNum) =>
      pdfTableOfContentsState.value.when(
          data: (data) => data[pageNum.toString()] ?? '',
          loading: () => 'loading',
          error: (error, st) => 'error');

  /// **********************************************************
  /// ****************** OVERRIDEN METHODS *********************
  /// **********************************************************

  @override
  Future<void> onInit() async {
    super.onInit();

    // Used for Android layout changes
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  /// **********************************************************
  /// ******************* PDF VIEW METHODS *********************
  /// **********************************************************

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

  /// ToDo: I just reset the controller when a new Pdf is created. I don't see
  /// a way to get rid of the old controller, so let me know if you think this
  /// will cause a memory leak
  Future onPdfViewCreated(PDFViewController pdfViewController) async {
    print('viewCreated');
    pdfController = null;
    pdfController = pdfViewController;
    await pdfController!.setPage(currentPage.value);
  }

  Future setPdfPage(int? page) async {
    print('setPage: $page');
    await pdfController!.setPage(page ?? 0);
  }

  void onPdfLinkHandler(String uri) {
    print('goto uri: $uri');
  }
}
