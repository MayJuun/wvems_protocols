import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../wvems_protocols.dart';

class ResultsTableOfContents extends ConsumerWidget {
  const ResultsTableOfContents(this._controller, {super.key});

  final FloatingSearchBarController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(pdfSearchResultsTableOfContentsProvider);
    return DecoratedSliver(
      decoration: const BoxDecoration(),
      sliver: SliverList.separated(
        itemCount: results.length,
        itemBuilder: (_, int index) {
          final item = results.entries.elementAt(index);
          final pageIndex = PagesUtil().pageNumToPageIndex(item.key);
          return ListTile(
            dense: true,
            title: Text(item.value),
            onTap: () {
              _controller.query =
                  item.value.replaceAll(' (cont.)'.toLowerCase(), '');
              ref
                  .read(multipageSyncServiceProvider.notifier)
                  .onPageSearch(newPageIndex: pageIndex);
              _controller.close();
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(indent: 8, endIndent: 8),
      ),
    );
  }
}
