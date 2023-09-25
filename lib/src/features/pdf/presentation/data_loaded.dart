import 'dart:io';

import 'package:flutter/material.dart';
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

    return Stack(
      fit: StackFit.expand,
      children: [
        DataPrimaryPdf(pdf: pdf),
        const PdfSearch(),
      ],
    );
  }
}
