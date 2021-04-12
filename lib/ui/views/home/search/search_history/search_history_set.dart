import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:wvems_protocols/models/models.dart';

import 'search_history_item.dart';

class SearchHistorySet extends StatelessWidget {
  const SearchHistorySet({Key? key, required this.searchStringsSet})
      : super(key: key);

  final Set<PdfSearchStrings> searchStringsSet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        Text('Number in History: ${searchStringsSet.length}'),
        const Gap(8),
        SizedBox(
          height: 330,
          child: ImplicitlyAnimatedList<PdfSearchStrings>(
            // shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            items: searchStringsSet.toList(),
            areItemsTheSame: (a, b) => a == b,
            itemBuilder: (context, animation, searchStrings, index) {
              return SizeFadeTransition(
                animation: animation,
                child: SearchHistoryItem(searchStrings: searchStrings),
              );
            },
            updateItemBuilder: (context, animation, searchStrings) {
              return FadeTransition(
                opacity: animation,
                child: SearchHistoryItem(searchStrings: searchStrings),
              );
            },
          ),
        ),
      ],
    );
  }
}
