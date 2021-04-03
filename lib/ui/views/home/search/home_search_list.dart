import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:wvems_protocols/models/models.dart';

import 'home_search_item.dart';

class HomeSearchList extends StatelessWidget {
  const HomeSearchList({Key? key, required this.searchStringsList})
      : super(key: key);

  final List<PdfSearchStrings> searchStringsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        Text('Number of Results: ${searchStringsList.length}'),
        const Gap(8),
        SizedBox(
          height: 330,
          child: ImplicitlyAnimatedList<PdfSearchStrings>(
            // shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            items: searchStringsList,
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
          ),
        ),
      ],
    );
  }
}