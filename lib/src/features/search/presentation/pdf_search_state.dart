import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

part 'pdf_search_state.g.dart';

const _minimumQueryLength = 3;

/// Automatically update displayed content based on search results above + query
@riverpod
class PdfSearchState extends _$PdfSearchState {
  @override
  String build() => '';

  void updateQuery(String query) {
    debugPrint('new state: $query');
    state = query;
  }
}

@riverpod
Map<PageId, String> pdfSearchResultsTableOfContents(
  PdfSearchResultsTableOfContentsRef ref,
) {
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
  PdfSearchResultsPageTextRef ref,
) {
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
List<SearchHistoryItem> pdfSearchResultsForSearchHistory(
  PdfSearchResultsForSearchHistoryRef ref,
) {
  final query = ref.watch(pdfSearchStateProvider);
  final searchHistory = ref.watch(querySearchHistoryItemsProvider(query));
  final searchHistoryValue = searchHistory.value;
  // ref.watch(searchHistoryChangesProvider);

  if (searchHistoryValue != null && !searchHistory.isLoading) {
    return searchHistoryValue;
  } else {
    return [];
  }
}

bool _hasValidSearchResults({
  required String query,
  required Map<PageId, PageText> pageTextValue,
}) {
  return pageTextValue.isNotEmpty && query.length >= _minimumQueryLength;
}

Map<PageId, PageTextResult> _generatePageTextResultMap({
  required String query,
  required Map<PageId, PageText> pageTextValue,
}) {
  final results = <PageId, PageTextResult>{};
  pageTextValue.forEach((pageId, pageText) {
    final lowerCaseQuery = query.toLowerCase();
    final lowerCasePageText = pageText.toLowerCase();

    /// the indexes for this particular page where the search string is found
    final stringIndexes = <int>[];

    var stringIndex = lowerCasePageText.indexOf(lowerCaseQuery);

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
