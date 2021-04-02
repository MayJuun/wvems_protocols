import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/ui/views/home/search/home_search_item.dart';

class HomeSearchExpanded extends StatelessWidget {
  Widget _buildAnimatedList(
          BuildContext context, List<PdfSearchStrings> searchStringsList) =>
      ImplicitlyAnimatedList<PdfSearchStrings>(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        items: searchStringsList.take(6).toList(),
        areItemsTheSame: (a, b) => a == b,
        itemBuilder: (context, animation, searchStrings, index) {
          return SizeFadeTransition(
            animation: animation,
            child: HomeSearchItem(searchStrings: searchStrings),
          );
        },
        updateItemBuilder: (context, animation, searchStrings) {
          return FadeTransition(
            opacity: animation,
            child: HomeSearchItem(searchStrings: searchStrings),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();

    return Material(
      color: Colors.white,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: searchController.pdfSearchState.value.when(
        data: (data) => _buildAnimatedList(context, data),
        history: (history) => _buildAnimatedList(context, history),
        loading: () => const CircularProgressIndicator(),
        error: (error, st) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
