import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdf_text/pdf_text.dart';

part 'pdf_doc_state.freezed.dart';

@freezed
abstract class PdfDocState with _$PdfDocState {
  const factory PdfDocState.data(PDFDoc pdfDoc) = PdfDocStateData;
  const factory PdfDocState.loading() = PdfDocStateLoading;
  const factory PdfDocState.error(Object error, StackTrace stackTrace) =
      PdfDocStateError;
}
