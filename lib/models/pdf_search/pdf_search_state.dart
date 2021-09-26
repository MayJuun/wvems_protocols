import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_reference/models/models.dart';

part 'pdf_search_state.freezed.dart';
part 'pdf_search_state.g.dart';

@freezed
class PdfSearchState with _$PdfSearchState {
  // Data is the active list of strings available in search
  // Format is: {pageNumber, [searchString1, searchString2]}
  const factory PdfSearchState.data(
          Map<String, List<PdfSearchStrings>> searchStringDataMap) =
      PdfSearchStateData;

  // History is the list of all prior searches that have been clicked on
  // We are using a set so that no duplicates are listed
  const factory PdfSearchState.history(
      Set<PdfSearchStrings> searchStringHistoryList) = PdfSearchStateHistory;

  // Standard loading and error states, as per other models
  const factory PdfSearchState.loading() = PdfSearchStateLoading;
  // Unlike other error states, stacktrace removed
  // this is for easier handling to/from JSON
  const factory PdfSearchState.error(Object error) = PdfSearchStateError;

  factory PdfSearchState.fromJson(Map<String, dynamic> json) =>
      _$PdfSearchStateFromJson(json);
}
