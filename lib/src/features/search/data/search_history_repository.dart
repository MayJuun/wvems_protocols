import 'dart:math';

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
