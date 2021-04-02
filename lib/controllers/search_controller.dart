import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';

// spec: https://pub.dev/packages/material_floating_search_bar
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

          /// for each index on that page, create a substring. The substring
          /// consists of 20 characters before the search string, 20 characters
          /// after the search string, and then the search string itself is
          /// displayed in bold
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
    final before =
        pageTextValue.substring(index - 20 < 0 ? 0 : index - 20, index);
    final result = query;
    final after = pageTextValue.substring(
        index + query.length,
        index + 20 + query.length >= pageTextValue.length
            ? pageTextValue.length - 1
            : index + 20 + query.length);

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

// RichText(
//                     text: TextSpan(
//                       children: <TextSpan>[
//                         TextSpan(
//                             text:
//                                 '...${pageText[key].substring(indexes[i] - 20 < 0 ? 0 : indexes[i] - 20, indexes[i])}'),
//                         TextSpan(
//                             text: pageText[key].substring(
//                                 indexes[i],
//                                 indexes[i] + query.length >=
//                                         pageText[key].length
//                                     ? pageText[key].length - 1
//                                     : indexes[i] + newValue.length),
//                             style:
//                                 const TextStyle(fontWeight: FontWeight.bold)),
//                         TextSpan(
//                             text:
//                                 '${pageText[key].substring(indexes[i] + newValue.length, indexes[i] + 20 + newValue.length >= pageText[key].length ? pageText[key].length - 1 : indexes[i] + 20 + newValue.length)}...'),
//                       ],
//                     ),
//                   )
