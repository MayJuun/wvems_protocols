import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class SearchController extends GetxController {
  final PdfStateController _pdfStateController = Get.find();

  final RxBool isLoading = false.obs;

  // spec: https://pub.dev/packages/material_floating_search_bar
  final FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  Future<List<Widget>> onQueryChanged(String newValue) async {
    // todo: reimplement
    if (newValue.length > 3) {
      _pdfStateController.pdfTextListState.value.when(data: (pageText) {
        /// page number and a list of the strings matching the search string from
        /// that particular page
        final foundStrings = <Widget>[];
        pageText.forEach(
          (key, value) {
            /// the indexes for this particular page where the search string is found
            final List<int> indexes = [];
            int curIndex = value.indexOf(newValue);

            /// find the index of each matching string on a page
            while (curIndex != -1) {
              indexes.add(curIndex);
              curIndex = value.indexOf(newValue, curIndex + 1);
            }

            /// for each index on that page, create a substring. The substring
            /// consists of 20 characters before the search string, 20 characters
            /// after the search string, and then the search string itself is
            /// displayed in bold
            // foundStrings.add(Text('PAGE $key'));
            for (var i = 0; i < indexes.length; i++) {
              foundStrings.add(
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          i % 2 == 0 ? Colors.grey[300] : Colors.white)),
                  onPressed: () {},
                  child: Container(),
                ),
              );
            }
          },
        );
        print('');
        return foundStrings;
      }, loading: () {
        //todo: handle loading state
      }, error: (e, st) {
        //todo: handle error state
      });
    }

    // todo: reimplement if (query == _query) { return; }
    // this will make it so that the query doesn't show isLoading content

    // isLoading.value = true;
    // // todo: use OBx, so that update() can be removed?
    // update();

    // await Future.delayed(const Duration(seconds: 2));

    // isLoading.value = false;
    // update();

    return [Container()];
  }

  void clear() {
    // todo: implement
    // _suggestions = history;
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
//                                 indexes[i] + newValue.length >=
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