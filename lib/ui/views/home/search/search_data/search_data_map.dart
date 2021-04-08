import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/ui/views/home/search/search_data/search_data_list.dart';

class SearchDataMap extends StatelessWidget {
  const SearchDataMap({Key? key, required this.searchResultsPageMap})
      : super(key: key);

  final Map<String, List<PdfSearchStrings>> searchResultsPageMap;

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();

    return Column(
      children: [
        const Gap(8),
        Obx(
          () => Text(
              'Number of Results: ${searchController.numberOfResults.value}'),
        ),
        const Gap(8),
        SizedBox(
          height: 330,
          child: ImplicitlyAnimatedList<List<PdfSearchStrings>>(
            // shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            items: searchResultsPageMap.values.toList(),
            areItemsTheSame: (a, b) => a == b,
            itemBuilder: (context, animation, searchStringsList, index) {
              return SizeFadeTransition(
                animation: animation,
                child: SearchDataList(searchStringsList: searchStringsList),
              );
            },
            updateItemBuilder: (context, animation, searchStringsList) {
              return FadeTransition(
                opacity: animation,
                child: SearchDataList(searchStringsList: searchStringsList),
              );
            },
          ),
        ),
      ],
    );
  }
}
