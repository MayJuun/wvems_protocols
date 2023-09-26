import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'search_history_repository.g.dart';

const _MAX_HISTORY_LENGTH = 20;

class SearchHistoryRepository {
  SearchHistoryRepository(this._lastSearchHistory);

  /// Used to track all areas that have been searched in the app
  /// Group by asset path, so your search only matches that asset
  final SearchHistory _lastSearchHistory;

  late final _searchHistory = InMemoryStore<SearchHistory>(_lastSearchHistory);

  Stream<SearchHistory> get watchSearchHistory => _searchHistory.stream;

  @visibleForTesting
  Future<List<SearchHistoryItem>> querySearchHistory(
      {required AssetPaths assetPath, required String query}) async {
    final results = <SearchHistoryItem>[];
    final searchHistory = _searchHistory.value.data[assetPath];
    if (searchHistory != null && searchHistory.isNotEmpty) {
      for (var item in searchHistory) {
        if (_hasValidPageTextResult(query, item) ||
            _hasValidTableOfContentsResult(query, item)) {
          results.add(item);
        }
      }
    }
    return results;
  }

  void onSearchItemSelected({
    required AssetPaths assetPath,
    required PageId pageId,
    PageTextResult? pageTextResult,
    String? tableOfContentsResult,
  }) {
    /// one of these two items needs to be selected
    assert(pageTextResult != null || tableOfContentsResult != null);
    final newSearchHistoryItem = SearchHistoryItem(
        pageId: pageId,
        pageTextResult: pageTextResult,
        tableOfContentsResult: tableOfContentsResult);

    final searchHistoryItemsForAsset = _searchHistory.value.data[assetPath];
    final Map<AssetPaths, List<SearchHistoryItem>> data = {
      ..._searchHistory.value.data
    };

    /// No prior data
    if (searchHistoryItemsForAsset == null ||
        searchHistoryItemsForAsset.isEmpty) {
      data[assetPath] = [newSearchHistoryItem];
      _searchHistory.value = SearchHistory(data);
    } else {
      /// Add to prior data, then trim down to max range
      final newHistoryItems = [
        newSearchHistoryItem,
        ...searchHistoryItemsForAsset
      ];

      data[assetPath] = newHistoryItems.sublist(
          0, min(_MAX_HISTORY_LENGTH, newHistoryItems.length));
      _searchHistory.value = SearchHistory(data);
    }
  }

  void removeSearchItem(
      {required AssetPaths assetPath,
      required SearchHistoryItem searchHistoryItem}) {
    final searchHistory = _searchHistory.value;

    searchHistory.data[assetPath]?.remove(searchHistoryItem);
    _searchHistory.value = searchHistory;
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

@Riverpod(keepAlive: true)
SearchHistoryRepository searchHistoryRepository(
    SearchHistoryRepositoryRef ref) {
  // set this in the app bootstrap section
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
Stream<SearchHistory> searchHistoryChanges(SearchHistoryChangesRef ref) {
  final searchHistoryRepository = ref.watch(searchHistoryRepositoryProvider);
  return searchHistoryRepository.watchSearchHistory;
}

@riverpod
Future<List<SearchHistoryItem>> querySearchHistoryItems(
    QuerySearchHistoryItemsRef ref, String query) async {
  ref.watch(searchHistoryChangesProvider);
  // put any debounce or timer/cancel methods here
  final searchHistoryRepository = ref.watch(searchHistoryRepositoryProvider);
  final assetPath = ref.watch(pdfBundleProvider).value?.assetPath;
  if (assetPath == null) {
    print('no asset path set, cant query search history items');
    return [];
  }
  return searchHistoryRepository.querySearchHistory(
      assetPath: assetPath, query: query);
}
