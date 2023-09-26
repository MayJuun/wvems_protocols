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

  Future<int> onPageChanged({
    required int? currentPageIndex,
    required int? newPageIndex,
    required int? pageCount,
    required PdfNavigator source,
  }) async {
    if (newPageIndex == null || currentPageIndex == null || pageCount == null) {
      throw StateError('Cannot navigate to/from a null page');
    }
    // int response = -1;

    final shouldShowSecondaryPdf = ref.read(shouldShowSecondaryPdfProvider);

    /// Skip any advanced logic and return the new page as normal
    if (!shouldShowSecondaryPdf || currentPageIndex == newPageIndex) {
      return newPageIndex;
    } else if (source == PdfNavigator.secondary && currentPageIndex == 0) {
      print('secondary controller first loaded, ignoring state changes');
      return newPageIndex;
    } else {
      /// What happens next depends on the source and the total number of pages
      print(
          'page changed for ${source.name}:  $currentPageIndex -> $newPageIndex');

      /// Double screen layout
      switch (source) {
        // Odd pages OR first page OR last page
        case PdfNavigator.primary:
          {
            if (_isValidPrimaryPage(
                pageIndex: newPageIndex, pageCount: pageCount)) {
              return newPageIndex;
            } else {
              final (primary, secondary) = _getNextValidForPrimary(
                  newPageIndex: newPageIndex,
                  currentPageIndex: currentPageIndex,
                  pageCount: pageCount);

              /// Use these data to modify both PDF pages
              _controllerPrimary.value?.setPage(primary);
              if (secondary != null) {
                _controllerSecondary.value?.setPage(secondary);
              }
              return primary;
            }
          }

        // Even pages. Can't be the first or last page.
        case PdfNavigator.secondary:
          {
            if (newPageIndex.isEven &&
                !_isFirstOrLastPage(
                    pageIndex: newPageIndex, pageCount: pageCount)) {
              print('EVEN, As intended');
              return newPageIndex;
            } else {
              final (primary, secondary) = _getNextValidForSecondary(
                  newPageIndex: newPageIndex,
                  currentPageIndex: currentPageIndex,
                  pageCount: pageCount);

              /// Use these data to modify both PDF pages
              _controllerPrimary.value?.setPage(primary);
              if (secondary != null) {
                _controllerSecondary.value?.setPage(secondary);
              }
              return primary;
            }
          }
      }
    }
  }

  bool _isInRange({required int pageIndex, required int pageCount}) {
    return pageIndex >= 0 && pageIndex < pageCount;
  }

  // TODO(FireJuun): make these methods visible for testing...and test them
  bool _isValidPrimaryPage({required int pageIndex, required int pageCount}) {
    return (pageIndex.isOdd ||
            _isFirstOrLastPage(pageIndex: pageIndex, pageCount: pageCount)) &&
        _isInRange(pageIndex: pageIndex, pageCount: pageCount);
  }

  (int, int?) _getNextValidForPrimary(
      {required int newPageIndex,
      required int currentPageIndex,
      required int pageCount}) {
    final shouldCountUp = newPageIndex > currentPageIndex;

    int newPrimaryIndex = newPageIndex;

    if (shouldCountUp) {
      for (var i = newPageIndex; i < pageCount; i++) {
        if (_isValidPrimaryPage(pageIndex: i, pageCount: pageCount)) {
          newPrimaryIndex = i;
          break;
        }
      }
    } else {
      /// shouldCountDown
      for (var i = newPageIndex; i >= 0; i--) {
        if (_isValidPrimaryPage(pageIndex: i, pageCount: pageCount)) {
          newPrimaryIndex = i;
          break;
        }
      }
    }

    final newSecondaryIndex = newPrimaryIndex + 1;
    // Count give a total number of pages, need to subtract
    final isPrimaryInRange =
        _isInRange(pageIndex: newPrimaryIndex, pageCount: pageCount);
    final isSecondaryInRange =
        _isInRange(pageIndex: newSecondaryIndex, pageCount: pageCount);

    return (
      isPrimaryInRange ? newPrimaryIndex : 0,
      isSecondaryInRange ? newSecondaryIndex : null
    );
  }

  (int, int?) _getNextValidForSecondary(
      {required int newPageIndex,
      required int currentPageIndex,
      required int pageCount}) {
    final shouldCountUp = newPageIndex > currentPageIndex;

    int newSecondaryIndex = newPageIndex;

    if (shouldCountUp) {
      for (var i = newPageIndex; i < pageCount; i++) {
        if (_isValidSecondaryPage(pageIndex: i, pageCount: pageCount)) {
          newSecondaryIndex = i;
          break;
        }
      }
    } else {
      /// shouldCountDown
      for (var i = newPageIndex; i >= 0; i--) {
        if (_isValidSecondaryPage(pageIndex: i, pageCount: pageCount)) {
          newSecondaryIndex = i;
          break;
        }
      }
    }

    final newPrimaryIndex = newSecondaryIndex - 1;
    // Count give a total number of pages, need to subtract
    final isSecondaryInRange = newSecondaryIndex <= pageCount - 1 &&
        _isValidSecondaryPage(
            pageIndex: newSecondaryIndex, pageCount: pageCount);
    final isPrimaryInRange = newPrimaryIndex >= 0;

    return (
      isPrimaryInRange ? newPrimaryIndex : 0,
      isSecondaryInRange ? newSecondaryIndex : null
    );
  }

  bool _isValidSecondaryPage({required int pageIndex, required int pageCount}) {
    return (pageIndex.isEven &&
            !_isFirstOrLastPage(pageIndex: pageIndex, pageCount: pageCount)) &&
        _isInRange(pageIndex: pageIndex, pageCount: pageCount);
  }

  Future<void> onPageSearch({required int newPageIndex}) async {
    final shouldShowSecondaryPdf = ref.read(shouldShowSecondaryPdfProvider);

    /// Skip any advanced logic and return the searched page as normal
    if (!shouldShowSecondaryPdf) {
      final controller = _controllerPrimary.value;
      if (controller == null) {
        throw StateError(
            'Unable to find search and jump to a page in this PDF');
      }
      _setPage(newPageIndex, controller);
    } else {
      final primaryController = _controllerPrimary.value;
      final secondaryController = _controllerSecondary.value;
      if (primaryController == null || secondaryController == null) {
        throw StateError('No controllers available for search');
      }

      final pageCount = await _controllerPrimary.value?.getPageCount();
      if (pageCount == null) {
        throw StateError('Page count not available');
      }

      if (_isValidPrimaryPage(pageIndex: newPageIndex, pageCount: pageCount)) {
        _setPage(newPageIndex, primaryController);
        final secondaryIndex = newPageIndex + 1;
        if (_isInRange(pageIndex: secondaryIndex, pageCount: pageCount)) {
          _setPage(secondaryIndex, secondaryController);
        }
      } else if (_isValidSecondaryPage(
          pageIndex: newPageIndex, pageCount: pageCount)) {
        _setPage(newPageIndex, secondaryController);
        final primaryIndex = newPageIndex - 1;
        if (_isInRange(pageIndex: primaryIndex, pageCount: pageCount)) {
          _setPage(primaryIndex, primaryController);
        }
      } else {
        throw RangeError('Unable to process search request');
      }

      print('page chagned for search: new $newPageIndex');
      // TODO(FireJuun): handle search in multi view
    }
  }

  Future<void> _setPage(int index, PDFViewController controller) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => controller.setPage(index));
  }
}

@riverpod
class ShouldShowSecondaryPdf extends _$ShouldShowSecondaryPdf {
  bool _isLayoutAboveBreakpoint = false;

  @override
  bool build() => false;

  void recheckFromData(
          {required int? currentPageIndex, required int? pageCount}) =>
      state = _isLayoutAboveBreakpoint &&
          !_isFirstOrLastPage(
              pageIndex: currentPageIndex, pageCount: pageCount);

  Future<void> recheckOnLayoutChange(bool isLayoutAboveBreakpoint) async {
    _isLayoutAboveBreakpoint = isLayoutAboveBreakpoint;
    try {
      final controller =
          ref.read(pdfNavigatorControllerProvider.notifier).controllerPrimary;
      if (controller == null) {
        state = false;
        print('controller not set');
        // throw StateError('No valid PDF controller');
      } else {
        final currentPageIndex = await controller.getCurrentPage();
        final pageCount = await controller.getPageCount();

        state = isLayoutAboveBreakpoint &&
            !_isFirstOrLastPage(
                pageIndex: currentPageIndex, pageCount: pageCount);
      }
    } catch (e) {
      print(e);
      state = false;
    }
  }
}

bool _isFirstOrLastPage({required int? pageIndex, required int? pageCount}) {
  if (pageIndex == null || pageCount == null) {
    throw StateError('Page ranges improperly set');
  }
  return pageIndex == 0 || (pageIndex == pageCount - 1);
}
