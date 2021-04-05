import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

import 'search_data/search_data_list.dart';
import 'search_history/search_history_list.dart';

class HomeSearchExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();

    return Material(
      color: Colors.white,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: Obx(
        () => searchController.pdfSearchState.value.when(
          data: (data) => SearchDataList(searchStringsList: data),
          history: (history) => SearchHistoryList(searchStringsList: history),
          loading: () => const CircularProgressIndicator(),
          error: (error, st) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
