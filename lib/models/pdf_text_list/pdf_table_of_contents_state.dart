import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_table_of_contents_state.freezed.dart';

@freezed
class PdfTableOfContentsState with _$PdfTableOfContentsState {
  const factory PdfTableOfContentsState.data(Map<String, dynamic> textList) =
      PdfTableOfContentsStateData;
  const factory PdfTableOfContentsState.loading() =
      PdfTableOfContentsStateLoading;
  const factory PdfTableOfContentsState.error(
      Object error, StackTrace stackTrace) = PdfTableOfContentsStateError;
}
