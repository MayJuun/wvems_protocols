import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_search_state.g.dart';

/// For the search bar, this decides what content should be displayed
enum PdfSearchFilters { all, tableOfContents, text, history }

@riverpod
class PdfSearchStateFilter extends _$PdfSearchStateFilter {
  @override
  PdfSearchFilters build() => PdfSearchFilters.all;

  void setFilter(PdfSearchFilters pdfSearchFilter) => state = pdfSearchFilter;
}

/// Automatically update displayed content based on search results above + query
@riverpod
class PdfSearchState extends _$PdfSearchState {
  @override
  String build() => '';

  void updateQuery(String query) {
    print('new state: $query');
    state = query;
  }
}

@riverpod
Map<PageId, String> pdfSearchResultsTableOfContents(
    PdfSearchResultsTableOfContentsRef ref) {
  final query = ref.watch(pdfSearchStateProvider);
  final tableOfContents = ref.watch(pdfTableOfContentsSearchProvider(query));
  final tableOfContentsValue = tableOfContents.value;

  if (tableOfContentsValue != null && !tableOfContents.isLoading) {
    return tableOfContentsValue;
  } else {
    return {};
  }
}

@riverpod
Map<PageId, String> pdfSearchResultsPageText(PdfSearchResultsPageTextRef ref) {
  final query = ref.watch(pdfSearchStateProvider);
  final pageText = ref.watch(pdfTextSearchProvider(query));
  final pageTextValue = pageText.value;

  if (pageTextValue != null && !pageText.isLoading) {
    return pageTextValue;
  } else {
    return {};
  }
}

// TODO(FireJuun): set up search history here

// switch (activeFilter) {
//     case PdfSearchFilters.all:
//       return <PageId, String>{..._getPageTextData(), _getTableOfContentsData()};

//     case PdfSearchFilters.tableOfContents:
//     case PdfSearchFilters.text:
//     case PdfSearchFilters.history:
//   }