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
          return TableOfContentsItem(
              pageId: item.key,
              tableOfContents: item.value,
              onPressed: () {
                /// todo: extract some of this logic out of UI
                final assetPath = ref.read(pdfBundleProvider).value?.assetPath;

                assert(assetPath != null);
                if (assetPath == null) {
                  throw StateError('No asset path available');
                }
                ref.read(searchHistoryRepositoryProvider).onSearchItemSelected(
                      assetPath: assetPath,
                      pageId: item.key,
                      tableOfContentsResult: item.value,
                    );

                _controller.query =
                    item.value.replaceAll(' (cont.)'.toLowerCase(), '');
                ref
                    .read(multipageSyncServiceProvider.notifier)
                    .onPageSearch(newPageIndex: pageIndex);
                _controller.close();
              });
        },
        separatorBuilder: (_, __) => const Divider(indent: 8, endIndent: 8),
      ),
    );
  }
}

class TableOfContentsItem extends ConsumerWidget {
  const TableOfContentsItem(
      {required this.pageId,
      required this.tableOfContents,
      required this.onPressed,
      this.trailing,
      super.key});

  final PageId pageId;
  final TableOfContents tableOfContents;
  final VoidCallback onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      dense: true,
      title: Text(
        tableOfContents,
        style: textTheme.bodyMedium!.apply(fontSizeDelta: 1),
      ),
      onTap: onPressed,
      trailing: trailing,
    );
  }
}
