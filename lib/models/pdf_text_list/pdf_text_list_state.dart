import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_text_list_state.freezed.dart';

@freezed
abstract class PdfTextListState with _$PdfTextListState {
  const factory PdfTextListState.data(List<String> textList) =
      PdfTextListStateData;
  const factory PdfTextListState.loading() = PdfTextListStateLoading;
  const factory PdfTextListState.error(Object error, StackTrace stackTrace) =
      PdfTextListStateError;
}
