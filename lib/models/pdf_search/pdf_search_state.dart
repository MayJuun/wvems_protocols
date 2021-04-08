import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wvems_protocols/models/models.dart';

part 'pdf_search_state.freezed.dart';

@freezed
class PdfSearchState with _$PdfSearchState {
  // Data is the active list of strings available in search
  // Format is: {pageNumber, [searchString1, searchString2]}
  const factory PdfSearchState.data(
          Map<String, List<PdfSearchStrings>> searchStringDataMap) =
      PdfSearchStateData;

  // History is the list of all prior searches that have been clicked on
  const factory PdfSearchState.history(
      List<PdfSearchStrings> searchStringHistoryList) = PdfSearchStateHistory;

  // Standard loading and error states, as per other models
  const factory PdfSearchState.loading() = PdfSearchStateLoading;
  const factory PdfSearchState.error(Object error, StackTrace stackTrace) =
      PdfSearchStateError;
}
