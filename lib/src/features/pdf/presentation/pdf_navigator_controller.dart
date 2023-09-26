import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_navigator_controller.g.dart';

enum PdfNavigator { primary, secondary }

@riverpod
class PdfNavigatorController extends _$PdfNavigatorController {
  /// Used to find the PRIMARY [PdfView] and to set specific pages.
  /// This is either the only PDF visible, or the PDF shown on the left.
  final _pdfViewKeyPrimary = UniqueKey();
  UniqueKey get pdfViewKeyPrimary => _pdfViewKeyPrimary;
  final _controllerPrimary = InMemoryStore<PDFViewController?>(null);
  PDFViewController? get controllerPrimary => _controllerPrimary.value;

  /// Used to find the SECONDARY [PdfView] and to set specific pages.
  /// For multi-screen layouts only. This is the PDF shown on the right.
  final _pdfViewKeySecondary = UniqueKey();
  UniqueKey get pdfViewKeySecondary => _pdfViewKeySecondary;
  final _controllerSecondary = InMemoryStore<PDFViewController?>(null);
  PDFViewController? get controllerSecondary => _controllerSecondary.value;

  @override
  Future<void> build() async {
    // nothing to do
  }

  void setPdfViewController(PDFViewController? newController,
      {required PdfNavigator pdfNavigator}) {
    switch (pdfNavigator) {
      case PdfNavigator.primary:
        _controllerPrimary.value = newController;
      case PdfNavigator.secondary:
        _controllerSecondary.value = newController;
    }
  }
}
