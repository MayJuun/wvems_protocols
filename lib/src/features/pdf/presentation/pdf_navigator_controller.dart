import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

part 'pdf_navigator_controller.g.dart';

enum PdfNavigator { primary, secondary }

@riverpod
class PdfNavigatorController extends _$PdfNavigatorController {
  /// Used to find the PRIMARY PdfView and to set specific pages.
  /// This is either the only PDF visible, or the PDF shown on the left.
  final _pdfViewKeyPrimary = UniqueKey();
  UniqueKey get pdfViewKeyPrimary => _pdfViewKeyPrimary;
  final _controllerPrimary = InMemoryStore<PDFViewController?>(null);

  /// Used to find the SECONDARY PdfView and to set specific pages.
  /// For multi-screen layouts only. This is the PDF shown on the right.
  final _pdfViewKeySecondary = UniqueKey();
  UniqueKey get pdfViewKeySecondary => _pdfViewKeySecondary;
  final _controllerSecondary = InMemoryStore<PDFViewController?>(null);

  @override
  Future<void> build() async {
    // nothing to do
  }

  void setPdfViewController(
    PDFViewController? newController, {
    required PdfNavigator pdfNavigator,
  }) {
    switch (pdfNavigator) {
      case PdfNavigator.primary:
        _controllerPrimary.value = newController;
      case PdfNavigator.secondary:
        _controllerSecondary.value = newController;
    }
  }

  Future<void> setPage({
    required int newIndex,
    required PdfNavigator pdfNavigator,
  }) async {
    final controller = pdfNavigator == PdfNavigator.primary
        ? _controllerPrimary.value
        : _controllerSecondary.value;

    assert(
      controller != null,
      throw AssertionError('Unable to set a PDF page'),
    );

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => controller!.setPage(newIndex));
  }

  Future<int?> getCurrentPageIndex({
    PdfNavigator pdfNavigator = PdfNavigator.primary,
  }) async {
    final controller = pdfNavigator == PdfNavigator.primary
        ? _controllerPrimary.value
        : _controllerSecondary.value;

    // assert(controller != null,
    //     throw AssertionError('Unable to get page count for this PDF'));

    int? currentPageIndex;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => currentPageIndex = await controller?.getCurrentPage(),
    );
    return currentPageIndex;
  }

  Future<int?> getPageCount() async {
    final controller = _controllerPrimary.value;
    // assert(controller != null,
    //     throw AssertionError('Unable to get page count for this PDF'));

    int? pageCount;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => pageCount = await controller?.getPageCount(),
    );
    return pageCount;
  }
}
