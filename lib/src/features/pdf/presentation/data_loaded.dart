import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../wvems_protocols.dart';

class DataLoaded extends ConsumerWidget {
  const DataLoaded({super.key, required this.pdf});
  final File pdf;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      pdfNavigatorControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    final pdfViewKey =
        ref.watch(pdfNavigatorControllerProvider.notifier).pdfViewKey;
    return Stack(
      fit: StackFit.expand,
      children: [
        // This PDF View fills the whole screen, which means clicking to the side won't close an overlay
        // In theory, GestureDetectors can help...but they won't pass through click inputs if in a stack
        // more info: https://stackoverflow.com/a/75845879
        // if you can set the pass-through to work, use: FocusManager.instance.primaryFocus?.unfocus();
        PDFView(
          nightMode: Theme.of(context).brightness == Brightness.dark,
          key: pdfViewKey,
          filePath: pdf.path,
          onViewCreated: (controller) => ref
              .read(pdfNavigatorControllerProvider.notifier)
              .onViewCreated(controller),
        ),
        const PdfSearch(),
      ],
    );
  }
}
