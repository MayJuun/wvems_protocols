import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wvems_protocols/models/models.dart';

part 'pdf_search_state.freezed.dart';

@freezed
abstract class PdfSearchState with _$PdfSearchState {
  factory PdfSearchState() = _PdfSearchState;

  // Data is the active list of strings available in search
  const factory PdfSearchState.data(List<PdfSearchStrings> searchStringList) =
      PdfSearchStateData;

  // History is the list of all prior searches that have been clicked on
  const factory PdfSearchState.history(
      List<PdfSearchStrings> searchStringList) = PdfSearchStateHistory;

  // Standard loading and error states, as per other models
  const factory PdfSearchState.loading() = PdfSearchStateLoading;
  const factory PdfSearchState.error(Object error, StackTrace stackTrace) =
      PdfSearchStateError;
}
