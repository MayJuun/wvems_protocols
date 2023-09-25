import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../wvems_protocols.dart';

const _breakpoint = Breakpoint.tablet;

/// This is the primary use case for a PDF. This should always be loaded
/// It is the only PDF that should be managed by the PDF navigator controller
/// If the app is in tablet mode (or if the app is in landscape mode), an optional
/// secondary PDF will appear, whose behavior is determined by the primary PDF

class DataPrimaryPdf extends ConsumerStatefulWidget {
  const DataPrimaryPdf({required this.pdf, super.key});

  final File pdf;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataPrimaryPdfState();
}

class _DataPrimaryPdfState extends ConsumerState<DataPrimaryPdf> {
  int? pageCount = 0;
  int? currentPageIndex = 0;
  bool shouldShowSecondaryPdf = false;
  bool isLayoutAboveBreakpoint = false;
  bool isReady = false;

  @override
  void dispose() {
    /// this is not the correct time to reset the (now unused) [PdfViewController]
    // ref
    //     .read(pdfNavigatorControllerProvider.notifier)
    //     .setPdfViewController(null, pdfNavigator: PdfNavigator.primary);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pdfViewKey =
        ref.watch(pdfNavigatorControllerProvider.notifier).pdfViewKeyPrimary;

    return LayoutBuilder(builder: (context, constraints) {
      final _isLayoutAboveBreakpoint = constraints.maxWidth >= _breakpoint;

      /// Layout has changed. recheck if secondary pdf should be shown, then set both values
      if (isLayoutAboveBreakpoint != _isLayoutAboveBreakpoint) {
        isLayoutAboveBreakpoint = _isLayoutAboveBreakpoint;
        shouldShowSecondaryPdf = ref
            .read(pdfNavigatorControllerProvider.notifier)
            .shouldShowSecondaryPdf(
                isLayoutAboveBreakpoint: isLayoutAboveBreakpoint,
                pageCount: pageCount,
                currentPageIndex: currentPageIndex);
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: PDFView(
              key: pdfViewKey,
              nightMode: Theme.of(context).brightness == Brightness.dark,
              fitPolicy: FitPolicy.BOTH,
              filePath: widget.pdf.path,
              onRender: (_pageCount) {
                setState(() {
                  pageCount = _pageCount;
                  isReady = true;
                });
              },
              onViewCreated: (PDFViewController pdfViewController) {
                /// used for page navigation by external widgets
                ref
                    .read(pdfNavigatorControllerProvider.notifier)
                    .setPdfViewController(pdfViewController,
                        pdfNavigator: PdfNavigator.primary);
              },
              onPageChanged: (newPageIndex, newPageCount) async {
                final _currentPageIndex = await ref
                    .read(pdfNavigatorControllerProvider.notifier)
                    .onPageChanged(
                        currentPageIndex: currentPageIndex,
                        newPageIndex: newPageIndex,
                        source: PdfNavigator.primary);
                final _shouldShowSecondaryPdf = ref
                    .read(pdfNavigatorControllerProvider.notifier)
                    .shouldShowSecondaryPdf(
                        isLayoutAboveBreakpoint: isLayoutAboveBreakpoint,
                        pageCount: pageCount,
                        currentPageIndex: currentPageIndex);
                setState(() {
                  currentPageIndex = _currentPageIndex;
                  shouldShowSecondaryPdf = _shouldShowSecondaryPdf;
                });
              },
            ),
          ),
          if (shouldShowSecondaryPdf)
            DataSecondaryPdf(pdf: widget.pdf, primaryPage: currentPageIndex!),
        ],
      );
    });
  }
}
