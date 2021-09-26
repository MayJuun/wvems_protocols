import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_reference/controllers/controllers.dart';

import 'search_data/search_data_map.dart';
import 'search_history/search_history_set.dart';

class HomeSearchExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();

    return Material(
      color: Theme.of(context).canvasColor,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: Obx(
        () => searchController.pdfSearchState.value.when(
          data: (data) => SearchDataMap(searchResultsPageMap: data),
          history: (history) => SearchHistorySet(searchStringsSet: history),
          loading: () => const Center(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          )),
          error: (error) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
