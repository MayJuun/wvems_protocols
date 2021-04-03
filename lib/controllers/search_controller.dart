import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';

/// the total number of characters listed before & after a search string
const _SUBSTRING = 16;

/// Floating Search Bar spec: https://pub.dev/packages/material_floating_search_bar
class SearchController extends GetxController {
  final PdfStateController _pdfStateController = Get.find();

  /// Current 'active state' of search, including history, data, and loading
  final Rx<PdfSearchState> pdfSearchState =
      PdfSearchState.history(tempSearchHistoryList).obs;

  /// Locally stored 'history' of the recent search items, limit 10
  // todo: should this be a stream?
  // todo: connect pdfSearchHistory to GetStorage in the onInit
  final List<PdfSearchStrings> _searchHistory = tempSearchHistoryList;
  final RxString _query = ''.obs;

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
    } else {
      // keep a history of the most recent query in memory
      _query.value = query;

      // Otherwise, run an async search call, which updates pdfSearchState
      isLoading.value = true;
      await _handleSearch(query);
      isLoading.value = false;
    }
  }

  void clear() {
    pdfSearchState.value = PdfSearchState.history(_searchHistory);
  }

  Future<bool> _handleSearch(String query) async {
    print('handle search');
    _pdfStateController.pdfTextListState.value.when(data: (pageText) {
      // holds all current search results, which are later saved to pdfSearchState
      final _searchResults = <PdfSearchStrings>[];

      /// get page number and a list of the strings matching the search string from
      /// that particular page
      pageText.forEach(
        (key, value) {
          /// the indexes for this particular page where the search string is found
          final List<int> indexes = [];
          int curIndex = value.indexOf(query);

          /// find the index of each matching string on a page
          while (curIndex != -1) {
            indexes.add(curIndex);
            _searchResults.add(_getSearchStringsFromIndex(
                curIndex, query, ValidatorsUtil().stringToInt(key), value));
            curIndex = value.indexOf(query, curIndex + 1);
          }

          // foundStrings.add(Text('PAGE $key'));
          // for (var i = 0; i < indexes.length; i++) {}
        },
      );

      pdfSearchState.value = PdfSearchState.data(_searchResults);
      print('');
    }, loading: () {
      //todo: handle loading state
    }, error: (e, st) {
      //todo: handle error state
    });

    return true;
  }

  PdfSearchStrings _getSearchStringsFromIndex(
      int index, String query, int pageTextKey, String pageTextValue) {
    // Note that pageNumber starts at 1, not 0

    // The 'before' substring consists of SUBSTRING characters before the search string
    final before = pageTextValue.substring(
        index - _SUBSTRING < 0 ? 0 : index - _SUBSTRING, index);

    // 'result' is the search string itself, which is displayed separately (e.g. bold)
    final result = query;

    // The 'after' substring conists of SUBSTRING characters after the search string
    final after = pageTextValue.substring(
        index + query.length,
        index + _SUBSTRING + query.length >= pageTextValue.length
            ? pageTextValue.length - 1
            : index + _SUBSTRING + query.length);

    return PdfSearchStrings(
        pageNumber: pageTextKey,
        beforeResult: before,
        result: result,
        afterResult: after);
  }

  @override
  void onClose() {
    floatingSearchBarController.dispose();
    super.onClose();
  }
}
