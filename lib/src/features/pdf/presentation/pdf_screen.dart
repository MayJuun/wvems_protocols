import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../wvems_protocols.dart';

class PdfScreen extends ConsumerWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      pdfScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    final state = ref.watch(pdfScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('WVEMS Protocols'.hardcoded),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer(builder: (context, ref, child) {
              final pdfBundle = ref.watch(pdfBundleProvider);
              return AsyncValueWidget<PdfBundle?>(
                value: pdfBundle,
                data: (pdfBundle) => pdfBundle == null
                    ? const NoDataLoaded()
                    : DataLoaded(pdf: pdfBundle.pdf),
              );
            }),
      floatingActionButton: FloatingActionButton(
          onPressed:
              ref.read(pdfScreenControllerProvider.notifier).clearActivePdf),
    );
  }
}

class NoDataLoaded extends StatelessWidget {
  const NoDataLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    const assetPaths = AssetPaths.values;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Please select a protocol:'.hardcoded,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                gapH4,
                Text(
                  'It will load automatically the next time you open this app'
                      .hardcoded,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            gapH32,
            Wrap(
              spacing: 8.0,
              runSpacing: 12.0,
              children: assetPaths
                  .map((asset) => Consumer(builder: (context, ref, child) {
                        return ElevatedButton(
                            onPressed: () => ref
                                .read(pdfScreenControllerProvider.notifier)
                                .loadPdfFromAsset(asset.path),
                            child: Text(asset.name));
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class DataLoaded extends StatelessWidget {
  const DataLoaded({super.key, required this.pdf});
  final File pdf;

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: pdf.path,
    );
  }
}
