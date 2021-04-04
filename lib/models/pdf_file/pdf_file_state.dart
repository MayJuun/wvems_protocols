import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_file_state.freezed.dart';

@freezed
class PdfFileState with _$PdfFileState {
  const factory PdfFileState.data(File file) = PdfFileStateData;
  const factory PdfFileState.loading() = PdfFileStateLoading;
  const factory PdfFileState.error(Object error, StackTrace stackTrace) =
      PdfFileStateError;
}
