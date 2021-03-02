import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_file.freezed.dart';

@freezed
abstract class PdfFile with _$PdfFile {
  const factory PdfFile.data(File file) = PdfFileData;
  const factory PdfFile.loading() = PdfFileLoading;
  const factory PdfFile.error(Object error, StackTrace stackTrace) =
      PdfFileError;
}
