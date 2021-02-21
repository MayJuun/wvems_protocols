import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf.freezed.dart';

@freezed
abstract class Pdf with _$Pdf {
  const factory Pdf.data(File file) = PdfData;
  const factory Pdf.loading() = PdfLoading;
  const factory Pdf.error(Object error, StackTrace stackTrace) = PdfError;
}
