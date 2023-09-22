import 'package:flutter/material.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(toolbarHeight: 0),
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
      floatingActionButton: state.isLoading
          ? null
          : FloatingActionButton.small(
              child: const Icon(Icons.home),
              onPressed:
                  ref.read(pdfNavigatorControllerProvider.notifier).goToHome),
    );
  }
}
