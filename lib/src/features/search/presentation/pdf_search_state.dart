import 'dart:ffi';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_search_state.g.dart';

const _MINIMUM_QUERY_LENGTH = 3;

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

@riverpod
List<SearchHistoryItem> pdfSearchResultsHistory(
    PdfSearchResultsHistoryRef ref) {
  final lastSearchHistory = ref.watch(searchHistoryChangesProvider).value;
  final results = <SearchHistoryItem>[];

  /// no prior history to search through. return blank list
  if (lastSearchHistory == null) {
    return results;
  }

  /// no valid search history to display
  final activeAsset = ref.watch(pdfBundleProvider).value?.assetPath;
  final data = lastSearchHistory.data[activeAsset];
  if (activeAsset == null || data == null || data.isEmpty) {
    return results;
  }

  final query = ref.watch(pdfSearchStateProvider);

  if (query.isEmpty) {
    return data;
  } else {
    /// Check each search history item, and filter based on the query
    data.forEach((searchHistoryItem) {
      if (_hasValidPageTextResult(query, searchHistoryItem) ||
          _hasValidTableOfContentsResult(query, searchHistoryItem)) {
        results.add(searchHistoryItem);
      }
    });
    return results;
  }
}

bool _hasValidPageTextResult(
    String query, SearchHistoryItem searchHistoryItem) {
  final pageTextResult = searchHistoryItem.pageTextResult;
  return pageTextResult != null &&
      pageTextResult.lowerCaseQuery.contains(query.toLowerCase());
}

bool _hasValidTableOfContentsResult(
    String query, SearchHistoryItem searchHistoryItem) {
  final tableOfContents = searchHistoryItem.tableOfContentsResult;
  return tableOfContents != null &&
      tableOfContents.toLowerCase().contains(query.toLowerCase());
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
