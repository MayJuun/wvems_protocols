import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_search_state.g.dart';

const _MINIMUM_QUERY_LENGTH = 3;

/// For the search bar, this decides what content should be displayed
enum PdfSearchFilters {
  tableOfContents('Table Of Contents'),
  pageText('Page Text'),
  history('History');

  final String label;

  const PdfSearchFilters(this.label);
}

@riverpod
class PdfSearchStateFilter extends _$PdfSearchStateFilter {
  @override
  PdfSearchFilters build() => PdfSearchFilters.tableOfContents;

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
Map<PageId, PageTextResult> pdfSearchResultsPageText(
    PdfSearchResultsPageTextRef ref) {
  final query = ref.watch(pdfSearchStateProvider);
  final pageText = ref.watch(pdfTextSearchProvider(query));
  final pageTextValue = pageText.value;

  if (pageTextValue != null &&
      !pageText.isLoading &&
      _hasValidSearchResults(query: query, pageTextValue: pageTextValue)) {
    return _generatePageTextResultMap(
      query: query,
      pageTextValue: pageTextValue,
    );
  } else {
    return {};
  }
}

bool _hasValidSearchResults(
    {required String query, required Map<PageId, PageText> pageTextValue}) {
  return pageTextValue.isNotEmpty && query.length >= _MINIMUM_QUERY_LENGTH;
}

Map<PageId, PageTextResult> _generatePageTextResultMap(
    {required String query, required Map<PageId, PageText> pageTextValue}) {
  final Map<PageId, PageTextResult> results = {};
  pageTextValue.forEach((pageId, pageText) {
    final lowerCaseQuery = query.toLowerCase();
    final lowerCasePageText = pageText.toLowerCase();

    /// the indexes for this particular page where the search string is found
    final List<int> stringIndexes = [];

    int stringIndex = lowerCasePageText.indexOf(lowerCaseQuery);

    while (stringIndex != -1) {
      stringIndexes.add(stringIndex);
      results[pageId] = PageTextResult(
        stringIndex: stringIndex,
        lowerCaseQuery: query.toLowerCase(),
        pageText: pageText,
      );
      stringIndex = lowerCasePageText.indexOf(lowerCaseQuery, stringIndex + 1);
    }
  });
  return results;
}

// TODO(FireJuun): set up search history here
@Riverpod(keepAlive: true)
class PdfSearchFilter extends _$PdfSearchFilter {
  @override
  PdfSearchFilters build() => PdfSearchFilters.tableOfContents;

  void setFilter(PdfSearchFilters newFilter) => state = newFilter;
}
