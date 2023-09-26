import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../wvems_protocols.dart';

/// This is the secondary use case for a PDF. It may often close and reform
/// Given its transience, it SHOULD NOT be managed by any PDF navigator controller
/// Typically, it appears if the app is in tablet mode (or if the app is in landscape mode)
/// The exception is when the first and last pages are shown

class DataSecondaryPdf extends ConsumerStatefulWidget {
  const DataSecondaryPdf(
      {required this.pdf,
      required this.primaryPage,
      required this.pageCount,
      super.key});

  final File pdf;
  final int primaryPage;
  final int pageCount;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DataSecondaryPdfState();
}

class _DataSecondaryPdfState extends ConsumerState<DataSecondaryPdf> {
  int? currentPageIndex = 0;
  bool isReady = false;

  @override
  void dispose() {
    /// this is not the correct time to reset the (now unused) [PdfViewController]
    // ref
    //     .read(pdfNavigatorControllerProvider.notifier)
    //     .setPdfViewController(null, pdfNavigator: PdfNavigator.secondary);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pdfViewKey =
        ref.watch(pdfNavigatorControllerProvider.notifier).pdfViewKeySecondary;

    final isValidSecondaryPage = ref
        .watch(multipageSyncServiceProvider.notifier)
        .isValidSecondaryPage(
            pageIndex: widget.primaryPage, pageCount: widget.pageCount);

    return Expanded(
      child: PDFView(
        key: pdfViewKey,
        nightMode: Theme.of(context).brightness == Brightness.dark,
        fitPolicy: FitPolicy.BOTH,
        filePath: widget.pdf.path,
        defaultPage:
            isValidSecondaryPage ? widget.primaryPage : widget.primaryPage + 1,
        onRender: (_pageCount) {
          setState(() {
            isReady = true;
          });
        },
        onViewCreated: (PDFViewController pdfViewController) {
          /// used for page sync
          ref
              .read(pdfNavigatorControllerProvider.notifier)
              .setPdfViewController(pdfViewController,
                  pdfNavigator: PdfNavigator.secondary);
        },
        onPageChanged: (newPageIndex, newPageCount) async {
          final _currentPageIndex = await ref
              .read(multipageSyncServiceProvider.notifier)
              .onPageChanged(
                  currentPageIndex: currentPageIndex,
                  newPageIndex: newPageIndex,
                  pageCount: widget.pageCount,
                  source: PdfNavigator.secondary);
          ref.read(shouldShowSecondaryPdfProvider.notifier).recheckFromData(
              currentPageIndex: newPageIndex, pageCount: newPageCount);

          setState(() {
            currentPageIndex = _currentPageIndex;
          });
        },
      ),
    );
  }
}
