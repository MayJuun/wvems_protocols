import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

const _pdfSplitScreenBreakpoint = Breakpoint.tablet;
const _portraitModePadding = 56.0;

/// This is the primary use case for a PDF. This should always be loaded
/// It is the only PDF that should be managed by the PDF navigator controller
/// If the app is in tablet mode (or if the app is in landscape mode), an
/// optional secondary PDF will appear, whose behavior is determined by
/// the primary PDF

class DataPrimaryPdf extends ConsumerStatefulWidget {
  const DataPrimaryPdf({required this.pdf, super.key});

  final File pdf;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataPrimaryPdfState();
}

class _DataPrimaryPdfState extends ConsumerState<DataPrimaryPdf> {
  int? pageCount = 0;
  int? currentPageIndex = 0;
  bool isReady = false;
  double maxWidth = 0;
  bool isLayoutAboveBreakpoint = false;

  @override
  void dispose() {
    /// this is not the correct time to reset the (unused) [PdfViewController]
    // ref
    //     .read(pdfNavigatorControllerProvider.notifier)
    //     .setPdfViewController(null, pdfNavigator: PdfNavigator.primary);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pdfViewKey =
        ref.watch(pdfNavigatorControllerProvider.notifier).pdfViewKeyPrimary;

    return LayoutBuilder(
      builder: (context, constraints) {
        var isLayoutAboveBreakpoint =
            constraints.maxWidth >= _pdfSplitScreenBreakpoint;

        /// Layout has changed. Store this new value,
        /// then check if secondary pdf should be shown
        if (isLayoutAboveBreakpoint != isLayoutAboveBreakpoint) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            isLayoutAboveBreakpoint = isLayoutAboveBreakpoint;
            ref
                .read(shouldShowSecondaryPdfProvider.notifier)
                .recheckOnLayoutChange(isLayoutAboveBreakpoint);
          });
        }

        final shouldShowSecondaryPdf =
            ref.watch(shouldShowSecondaryPdfProvider);
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;

        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).orientation == Orientation.portrait
                ? _portraitModePadding
                : 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PDFView(
                  key: pdfViewKey,
                  nightMode: isDarkMode,
                  fitPolicy: FitPolicy.BOTH,
                  filePath: widget.pdf.path,
                  onRender: (pageCount) {
                    setState(() {
                      pageCount = pageCount;
                      isReady = true;
                    });
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    /// used for page navigation by external widgets
                    ref
                        .read(pdfNavigatorControllerProvider.notifier)
                        .setPdfViewController(
                          pdfViewController,
                          pdfNavigator: PdfNavigator.primary,
                        );
                  },
                  onPageChanged: (newPageIndex, newPageCount) async {
                    // await ref
                    //     .read(multipageSyncServiceProvider.notifier)
                    //     .onPageChanged(
                    //         currentPageIndex: currentPageIndex,
                    //         newPageIndex: newPageIndex,
                    //         pageCount: pageCount,
                    //         source: PdfNavigator.primary);
                    ref
                        .read(shouldShowSecondaryPdfProvider.notifier)
                        .recheckFromData(
                          currentPageIndex: newPageIndex,
                          pageCount: newPageCount,
                        );

                    setState(() {
                      currentPageIndex = newPageIndex;
                    });
                  },
                ),
              ),
              if (shouldShowSecondaryPdf)
                DataSecondaryPdf(
                  pdf: widget.pdf,
                  primaryPage: currentPageIndex!,
                  pageCount: pageCount!,
                ),
            ],
          ),
        );
      },
    );
  }
}
