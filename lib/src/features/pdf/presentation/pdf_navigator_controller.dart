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

  Future<void> goToHome() async {
    final controller = _controllerPrimary.value;
    if (controller == null) {
      throw StateError('No PDF Controller set');
    }
    return _setPage(0, controller);
  }

  bool shouldShowSecondaryPdf(
      {required bool isLayoutAboveBreakpoint,
      required int? pageCount,
      required int? currentPageIndex}) {
    if (pageCount == null || currentPageIndex == null) {
      print('pdf probably loading');
      return false;
    } else {
      return isLayoutAboveBreakpoint &&
          !_isFirstOrLastPage(
              currentPageIndex: currentPageIndex, pageCount: pageCount);
    }
  }

  bool _isFirstOrLastPage(
          {required int currentPageIndex, required int pageCount}) =>
      currentPageIndex == 0 || (currentPageIndex == pageCount - 1);

  Future<int?> onPageChanged({
    required int? currentPageIndex,
    required int? newPageIndex,
    required PdfNavigator source,
  }) async {
    /// Setting page with no secondary controller instantiated
    /// Skip any advanced logic and return the new page as normal
    if (source == PdfNavigator.primary && _controllerSecondary.value == null) {
      return newPageIndex;
    } else {
      /// What happens next depends on the source and the total number of pages
      // TODO(FireJuun): handle page changed in multi-view
      return newPageIndex;
    }
  }

  Future<void> onPageSearch({required int newPageIndex}) async {
    /// If no secondary controller set, assume this is a simple layout
    if (_controllerSecondary.value == null) {
      final controller = _controllerPrimary.value;
      if (controller == null) {
        throw StateError(
            'Unable to find search and jump to a page in this PDF');
      }
      _setPage(newPageIndex, controller);
    } else {
      // TODO(FireJuun): handle page search in multi-view
    }
  }

  Future<void> _setPage(int index, PDFViewController controller) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => controller.setPage(index));
  }
}
