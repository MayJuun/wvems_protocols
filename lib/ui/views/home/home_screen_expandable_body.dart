import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

import 'to_remove/place.dart';
import 'to_remove/search_model.dart';

class HomeScreenExpandableBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();
    final model = searchController.model;

    return Material(
      color: Colors.white,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: ImplicitlyAnimatedList<Place>(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        items: model.suggestions.take(6).toList(),
        areItemsTheSame: (a, b) => a == b,
        itemBuilder: (context, animation, place, i) {
          return SizeFadeTransition(
            animation: animation,
            child: buildItem(context, place),
          );
        },
        updateItemBuilder: (context, animation, place) {
          return FadeTransition(
            opacity: animation,
            child: buildItem(context, place),
          );
        },
      ),
    );
  }

  Widget buildItem(BuildContext context, Place place) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final SearchController searchController = Get.find();
    final model = searchController.model;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            FloatingSearchBar.of(context).close();
            Future.delayed(
              const Duration(milliseconds: 500),
              () => model.clear(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: model.suggestions == history
                        ? const Icon(Icons.history, key: Key('history'))
                        : const Icon(Icons.place, key: Key('place')),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.level2Address,
                        style: textTheme.bodyText2
                            .copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (model.suggestions.isNotEmpty && place != model.suggestions.last)
          const Divider(height: 0),
      ],
    );
  }
}
