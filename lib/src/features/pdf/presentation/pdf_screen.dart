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
          onPressed: () =>
              ref.read(pdfScreenControllerProvider.notifier).clearActivePdf()),
    );
  }
}

class NoDataLoaded extends StatelessWidget {
  const NoDataLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    const assetPaths = AssetPaths.values;

    return Column(
      children: [
        Text('No Protocols Loaded. Select an Option:'.hardcoded),
        Expanded(
          child: ListView.builder(
            itemCount: assetPaths.length,
            itemBuilder: (context, index) {
              final asset = assetPaths[index];
              return Consumer(builder: (context, ref, child) {
                return ElevatedButton(
                    onPressed: () => ref
                        .read(pdfScreenControllerProvider.notifier)
                        .loadPdfFromAsset(asset.path),
                    child: Text(asset.name));
              });
            },
          ),
        ),
      ],
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
