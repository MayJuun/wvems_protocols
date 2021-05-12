import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';

/// the total number of characters listed before & after a search string
const _SUBSTRING = 20;

/// Floating Search Bar spec: https://pub.dev/packages/material_floating_search_bar
class SearchController extends GetxController {
  static SearchController get to => Get.find();

  final PdfStateController _pdfStateController = Get.find();
  final StorageController _data = Get.find();

  /// Current 'active state' of search, including history, data, and loading
  final Rx<PdfSearchState> pdfSearchState =
      const PdfSearchState.history(<PdfSearchStrings>{}).obs;

  /// Locally stored 'history' of the recent search items, limit 10
  // todo: should this be a stream?
  // todo: connect pdfSearchHistory to GetStorage in the onInit
  final RxSet<PdfSearchStrings> _searchHistory = <PdfSearchStrings>{}.obs;
  final RxString _query = ''.obs;
  final RxInt numberOfResults = 0.obs;

  final RxBool isLoading = false.obs;

  final FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  Future<void> onQueryChanged(String query) async {
    // Don't bother updating if the query string hasn't changed
    if (_query.value == query) {
      return;
    }

    // When the query is empty, assign pdfSearchState to type .history
    if (query.isEmpty) {
      pdfSearchState.value.maybeWhen(
        history: (history) {
          if (history == _searchHistory) {
            /// search history already visible in pdfSearchState
            /// no need to update this stream
            return;
          } else {
            pdfSearchState.value = PdfSearchState.history(_searchHistory);
          }
        },
        orElse: () =>
            pdfSearchState.value = PdfSearchState.history(_searchHistory),
      );
    } else if (query.length > 2) {
      // keep a history of the most recent query in memory
      _query.value = query;

      // Otherwise, run an async search call, which updates pdfSearchState
      isLoading.value = true;
      await _validateStateAndHandleSearch(query);
      isLoading.value = false;
    }
  }

  Future<void> clear() async {
    pdfSearchState.value = const PdfSearchState.loading();
    await getSearchHistoryFromStore(_pdfStateController.asset.value);
  }

  /// **********************************************************
  /// ************ SEARCH AND VALIDATION METHODS ***************
  /// **********************************************************

  Future<bool> _validateStateAndHandleSearch(String query) async {
    /// First, check to see if pdf state data are valid

    _pdfStateController.pdfTableOfContentsState.value.when(
      data: (tableOfContents) async {
        await _pdfStateController.pdfTextListState.value.when(
            data: (pageText) async {
          /// Note, search will only be performed
          /// if both table of contents and text list have valid data
          await _handleSearch(tableOfContents, pageText, query);
        }, loading: () {
          print('Error, pdfTextList is still loading');
        }, error: (e, st) {
          print('Error, pdfTextList has an error: $e');
        });
      },
      loading: () {
        print('Error, Table of Contents is still loading');
      },
      error: (e, st) {
        print('Error, Table of Contents has an error: $e');
      },
    );

    return true;
  }

  Future<bool> _handleSearch(Map<String, dynamic> tableOfContents,
      Map<String, dynamic> pageText, String query) async {
    // holds all current search results, which are later saved to pdfSearchState
    final searchResultsPageMap = <String, List<PdfSearchStrings>>{};
    int resultsCounter = 0;

    final _pageKeyList = pageText.keys.toList();

    /// get page number and a list of the strings matching that page
    pageText.forEach(
      (pageKey, pageValue) {
        final searchResultStringsList = <PdfSearchStrings>[];

        /// the indexes for this particular page where the search string is found
        final List<int> stringIndexes = [];
        int curIndex = pageValue.indexOf(query);
        final pageIndex = _pageKeyList.indexOf(pageKey);

        /// find the index of each matching string on a page
        while (curIndex != -1) {
          stringIndexes.add(curIndex);
          searchResultStringsList.add(
            _getSearchStringsFromIndex(
              stringIndex: curIndex,
              query: query,
              pageNumber: ValidatorsUtil().stringToInt(pageKey),
              pageIndex: pageIndex,
              pageTextValue: pageValue,
            ),
          );

          resultsCounter++;
          curIndex = pageValue.indexOf(query, curIndex + 1);
        }

        // Add all search results for the given page
        if (searchResultStringsList.isNotEmpty) {
          searchResultsPageMap[pageKey] = searchResultStringsList;
          print('');
        }
      },
    );

    pdfSearchState.value = PdfSearchState.data(searchResultsPageMap);
    numberOfResults.value = resultsCounter;
    print('');
    return true;
  }

  PdfSearchStrings _getSearchStringsFromIndex(
      {required int stringIndex,
      required String query,
      required int pageNumber,
      required int pageIndex,
      required String pageTextValue}) {
    // Note that pageNumber starts at 1, not 0

    // The 'before' substring consists of SUBSTRING characters before the search string
    final before = pageTextValue.substring(
        stringIndex - _SUBSTRING < 0 ? 0 : stringIndex - _SUBSTRING,
        stringIndex);

    // 'result' is the search string itself, which is displayed separately (e.g. bold)
    final result = query;

    // The 'after' substring conists of SUBSTRING characters after the search string
    final after = pageTextValue.substring(
        stringIndex + query.length,
        stringIndex + _SUBSTRING + query.length >= pageTextValue.length
            ? pageTextValue.length - 1
            : stringIndex + _SUBSTRING + query.length);

    return PdfSearchStrings(
        pageNumber: pageNumber,
        pageIndex: pageIndex,
        beforeResult: before,
        result: result,
        afterResult: after);
  }

  /// **********************************************************
  /// ************ SEARCH HISTORY STORAGE METHODS **************
  /// **********************************************************

  Future<void> addToSearchHistory(PdfSearchStrings searchStrings) async {
    _searchHistory.remove(searchStrings);
    _searchHistory.add(searchStrings);
    _updateSearchHistoryStore();
  }

  Future<void> removeFromSearchHistory(PdfSearchStrings searchStrings) async {
    _searchHistory.remove(searchStrings);
    _updateSearchHistoryStore();
  }

  Future<bool> _updateSearchHistoryStore() async {
    final Map<String, dynamic> dataAsJson =
        PdfSearchState.history(_searchHistory).toJson();

    print(dataAsJson);
    await _data.store.write(_pdfStateController.asset.value, dataAsJson);
    update();
    return true;
  }

  Future<bool> getSearchHistoryFromStore(String asset) async {
    try {
      final Map<String, dynamic> dataAsJson =
          _data.store.read(asset) ?? _blankSearchHistory;

      final dataAsSearchHistory =
          PdfSearchState.fromJson(dataAsJson) as PdfSearchStateHistory;

      _assignSearchHistory(dataAsSearchHistory.searchStringHistoryList);
    } catch (e) {
      print('unable to load search history: $e');
      // _searchHistory.assignAll();
    }

    print('search history data loaded');
    return true;
  }

  void _assignSearchHistory(Set<PdfSearchStrings> obj) {
    _searchHistory.assignAll(obj);
    pdfSearchState.value = PdfSearchState.history(obj);
  }

  /// **********************************************************
  /// ****************** OVERRIDEN METHODS *********************
  /// **********************************************************

  @override
  Future<void> onInit() async {
    await getSearchHistoryFromStore(_pdfStateController.asset.value);
    super.onInit();
  }

  @override
  void onClose() {
    floatingSearchBarController.dispose();
    super.onClose();
  }
}

final Map<String, dynamic> _blankSearchHistory = {
  'searchStringHistoryList': [],
  'runtimeType': 'history',
};
