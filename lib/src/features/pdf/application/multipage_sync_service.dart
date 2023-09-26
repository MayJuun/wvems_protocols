import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'multipage_sync_service.g.dart';

@riverpod
class MultipageSyncService extends _$MultipageSyncService {
  @override
  Future<void> build() async {
    // nothing to do
  }

  Future<void> goToHome() async =>
      _setPage(newIndex: 0, pdfNavigator: PdfNavigator.primary);

  bool isFirstOrLastPage({required int? pageIndex, required int? pageCount}) {
    if (pageIndex == null || pageCount == null) {
      throw StateError('Page ranges improperly set');
    }
    return pageIndex == 0 || (pageIndex == pageCount - 1);
  }

  bool isInRange({required int pageIndex, required int pageCount}) {
    return pageIndex >= 0 && pageIndex < pageCount;
  }

// TODO(FireJuun): make these methods visible for testing...and test them
  bool isValidPrimaryPage({required int pageIndex, required int pageCount}) {
    return (pageIndex.isOdd ||
            isFirstOrLastPage(pageIndex: pageIndex, pageCount: pageCount)) &&
        isInRange(pageIndex: pageIndex, pageCount: pageCount);
  }

  bool isValidSecondaryPage({required int pageIndex, required int pageCount}) {
    return (pageIndex.isEven &&
            !isFirstOrLastPage(pageIndex: pageIndex, pageCount: pageCount)) &&
        isInRange(pageIndex: pageIndex, pageCount: pageCount);
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

    final shouldShowSecondaryPdf = ref.read(shouldShowSecondaryPdfProvider);

    /// Single view, or no page was changed.
    /// Skip any advanced logic and return the new page as normal.
    if (!shouldShowSecondaryPdf || currentPageIndex == newPageIndex) {
      return newPageIndex;
    } else

    /// Secondary view is loaded. Exaclty which page will load is determined
    /// by what is sent to the [DataSecondaryPdf] widget.
    /// If it is sent a valid secondary page, that will load
    /// otherwise, it'll load the next available secondary page.
    /// An example to recreate this is to have a 'secondary' page shown
    /// on the portrait view, then move to landscape.
    if (source == PdfNavigator.secondary && currentPageIndex == 0) {
      final primaryPageIndex = await ref
          .read(pdfNavigatorControllerProvider.notifier)
          .getCurrentPageIndex();
      if (primaryPageIndex != null && primaryPageIndex == newPageIndex) {
        /// fix the primary page
        _setPage(
            newIndex: primaryPageIndex - 1, pdfNavigator: PdfNavigator.primary);
      }
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
            if (isValidPrimaryPage(
                pageIndex: newPageIndex, pageCount: pageCount)) {
              return newPageIndex;
            } else {
              final (primary, secondary) = _getNextValidForPrimary(
                  newPageIndex: newPageIndex,
                  currentPageIndex: currentPageIndex,
                  pageCount: pageCount);

              /// Use these data to modify both PDF pages
              _setPage(newIndex: primary, pdfNavigator: PdfNavigator.primary);

              if (secondary != null) {
                _setPage(
                    newIndex: secondary, pdfNavigator: PdfNavigator.secondary);
              }
              return primary;
            }
          }

        // Even pages. Can't be the first or last page.
        case PdfNavigator.secondary:
          {
            if (newPageIndex.isEven &&
                !isFirstOrLastPage(
                    pageIndex: newPageIndex, pageCount: pageCount)) {
              print('EVEN, As intended');
              return newPageIndex;
            } else {
              final (primary, secondary) = _getNextValidForSecondary(
                  newPageIndex: newPageIndex,
                  currentPageIndex: currentPageIndex,
                  pageCount: pageCount);

              /// Use these data to modify both PDF pages
              _setPage(newIndex: primary, pdfNavigator: PdfNavigator.primary);

              if (secondary != null) {
                _setPage(
                    newIndex: secondary, pdfNavigator: PdfNavigator.secondary);
              }
              return primary;
            }
          }
      }
    }
  }

  (int, int?) _getNextValidForPrimary(
      {required int newPageIndex,
      required int currentPageIndex,
      required int pageCount}) {
    final shouldCountUp = newPageIndex > currentPageIndex;

    int newPrimaryIndex = newPageIndex;

    if (shouldCountUp) {
      for (var i = newPageIndex; i < pageCount; i++) {
        if (isValidPrimaryPage(pageIndex: i, pageCount: pageCount)) {
          newPrimaryIndex = i;
          break;
        }
      }
    } else {
      /// shouldCountDown
      for (var i = newPageIndex; i >= 0; i--) {
        if (isValidPrimaryPage(pageIndex: i, pageCount: pageCount)) {
          newPrimaryIndex = i;
          break;
        }
      }
    }

    final newSecondaryIndex = newPrimaryIndex + 1;
    // Count give a total number of pages, need to subtract
    final isPrimaryInRange =
        isInRange(pageIndex: newPrimaryIndex, pageCount: pageCount);
    final isSecondaryInRange =
        isInRange(pageIndex: newSecondaryIndex, pageCount: pageCount);

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
        if (isValidSecondaryPage(pageIndex: i, pageCount: pageCount)) {
          newSecondaryIndex = i;
          break;
        }
      }
    } else {
      /// shouldCountDown
      for (var i = newPageIndex; i >= 0; i--) {
        if (isValidSecondaryPage(pageIndex: i, pageCount: pageCount)) {
          newSecondaryIndex = i;
          break;
        }
      }
    }

    final newPrimaryIndex = newSecondaryIndex - 1;
    // Count give a total number of pages, need to subtract
    final isSecondaryInRange = newSecondaryIndex <= pageCount - 1 &&
        isValidSecondaryPage(
            pageIndex: newSecondaryIndex, pageCount: pageCount);
    final isPrimaryInRange = newPrimaryIndex >= 0;

    return (
      isPrimaryInRange ? newPrimaryIndex : 0,
      isSecondaryInRange ? newSecondaryIndex : null
    );
  }

  Future<void> onPageSearch({required int newPageIndex}) async {
    final shouldShowSecondaryPdf = ref.read(shouldShowSecondaryPdfProvider);

    /// Skip any advanced logic and return the searched page as normal
    if (!shouldShowSecondaryPdf) {
      _setPage(newIndex: newPageIndex, pdfNavigator: PdfNavigator.primary);
    } else {
      final pdfNotifier = ref.read(pdfNavigatorControllerProvider.notifier);

      final pageCount = await pdfNotifier.getPageCount();
      if (pageCount == null) {
        throw StateError('Page count not available');
      }

      if (isValidPrimaryPage(pageIndex: newPageIndex, pageCount: pageCount)) {
        _setPage(newIndex: newPageIndex, pdfNavigator: PdfNavigator.primary);
        final secondaryIndex = newPageIndex + 1;
        if (isInRange(pageIndex: secondaryIndex, pageCount: pageCount)) {
          _setPage(
              newIndex: secondaryIndex, pdfNavigator: PdfNavigator.secondary);
        }
      } else if (isValidSecondaryPage(
          pageIndex: newPageIndex, pageCount: pageCount)) {
        _setPage(newIndex: newPageIndex, pdfNavigator: PdfNavigator.secondary);
        final primaryIndex = newPageIndex - 1;
        if (isInRange(pageIndex: primaryIndex, pageCount: pageCount)) {
          _setPage(newIndex: primaryIndex, pdfNavigator: PdfNavigator.primary);
        }
      } else {
        throw RangeError('Unable to process search request');
      }

      print('page chagned for search: new $newPageIndex');
      // TODO(FireJuun): handle search in multi view
    }
  }

  Future<void> _setPage(
      {required int newIndex, required PdfNavigator pdfNavigator}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(pdfNavigatorControllerProvider.notifier)
        .setPage(newIndex: newIndex, pdfNavigator: pdfNavigator));
  }
}

@riverpod
class ShouldShowSecondaryPdf extends _$ShouldShowSecondaryPdf {
  bool _isLayoutAboveBreakpoint = false;

  @override
  bool build() => false;

  void recheckFromData(
      {required int? currentPageIndex, required int? pageCount}) {
    final isFirstOrLastPage = ref
        .read(multipageSyncServiceProvider.notifier)
        .isFirstOrLastPage(pageIndex: currentPageIndex, pageCount: pageCount);
    state = _isLayoutAboveBreakpoint && !isFirstOrLastPage;
  }

  Future<void> recheckOnLayoutChange(bool isLayoutAboveBreakpoint) async {
    _isLayoutAboveBreakpoint = isLayoutAboveBreakpoint;

    final navigator = ref.read(pdfNavigatorControllerProvider.notifier);
    final currentPageIndex = await navigator.getCurrentPageIndex();
    final pageCount = await navigator.getPageCount();

    if (currentPageIndex == null || pageCount == null) {
      state = false;
      return;
    }

    final isFirstOrLastPage = ref
        .read(multipageSyncServiceProvider.notifier)
        .isFirstOrLastPage(pageIndex: currentPageIndex, pageCount: pageCount);
    final shouldShowSecondaryPdf =
        isLayoutAboveBreakpoint && !isFirstOrLastPage;

    /// check to see if the current page should be shown on the primary (left) or the secondary (right) PDF controller
    if (shouldShowSecondaryPdf) {
      final bool isValidSecondaryPage = ref
          .read(multipageSyncServiceProvider.notifier)
          .isValidSecondaryPage(
              pageIndex: currentPageIndex, pageCount: pageCount);
      if (isValidSecondaryPage) {
        ref.read(pdfNavigatorControllerProvider.notifier).setPage(
            newIndex: currentPageIndex - 1, pdfNavigator: PdfNavigator.primary);
      }
    }

    state = shouldShowSecondaryPdf;
  }
}
