import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/views/home/search/home_search_list.dart';

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
          data: (data) => HomeSearchList(searchStringsList: data),
          history: (history) => HomeSearchList(searchStringsList: history),
          loading: () => const CircularProgressIndicator(),
          error: (error, st) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
