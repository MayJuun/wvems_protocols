import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_navigator_controller.g.dart';

@riverpod
class PdfNavigatorController extends _$PdfNavigatorController {
  /// Used to find the PdfView and set specific pages.
  /// For multi-screen layouts, this method should only be used on the left most screen.
  final _pdfViewKey = UniqueKey();
  UniqueKey get pdfViewKey => _pdfViewKey;

  final _controller = InMemoryStore<PDFViewController?>(null);

  @override
  Future<void> build() async {
    // nothing to do
  }

  void onViewCreated(PDFViewController? controller) =>
      _controller.value = controller;

  Future<void> setPdfPage(int index) async => await _setPage(index);

  Future<void> goToHome() async => await _setPage(0);

  Future<void> _setPage(int index) async {
    final controller = _controller.value;

    if (controller != null) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() => controller.setPage(index));
    } else {
      throw StateError('Unable to change pages in a PDF');
    }
  }
}
