import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../wvems_protocols.dart';

class ResultsHistory extends ConsumerWidget {
  const ResultsHistory(this._controller, {super.key});

  final FloatingSearchBarController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(FireJuun): this is not rebuilding when this provider is updated
    final results = ref.watch(pdfSearchResultsHistoryProvider);
    return DecoratedSliver(
      decoration: const BoxDecoration(),
      sliver: results.isEmpty
          ? const SliverToBoxAdapter(child: SizedBox.shrink())
          : SliverList.separated(
              itemCount: results.length,
              itemBuilder: (_, int index) {
                return Consumer(builder: (context, ref, child) {
                  final item = ref.watch(pdfSearchResultsHistoryProvider
                      .select((value) => value[index]));
                  final pageIndex = PagesUtil().pageNumToPageIndex(item.pageId);

                  return item.pageTextResult != null
                      ? PageTextItem(
                          pageId: item.pageId,
                          pageTextResult: item.pageTextResult!,
                          onPressed: () {
                            ref
                                .read(multipageSyncServiceProvider.notifier)
                                .onPageSearch(newPageIndex: pageIndex);
                            _controller.close();
                          },
                          trailing: RemoveHistoryItem(item),
                        )
                      : TableOfContentsItem(
                          pageId: item.pageId,
                          tableOfContents:
                              item.tableOfContentsResult ?? 'NO DATA',
                          onPressed: () {
                            ref
                                .read(multipageSyncServiceProvider.notifier)
                                .onPageSearch(newPageIndex: pageIndex);
                            _controller.close();
                          },
                          trailing: RemoveHistoryItem(item),
                        );
                });
              },
              separatorBuilder: (_, __) =>
                  const Divider(indent: 8, endIndent: 8),
            ),
    );
  }
}

class RemoveHistoryItem extends ConsumerWidget {
  const RemoveHistoryItem(this.item, {super.key});

  final SearchHistoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton.outlined(
        visualDensity: VisualDensity.compact,
        // constraints: const BoxConstraints(maxHeight: 24),
        onPressed: () {
          /// todo: extract some of this logic out of UI
          final assetPath = ref.read(pdfBundleProvider).value?.assetPath;

          assert(assetPath != null);
          if (assetPath == null) {
            throw StateError('No asset path available');
          }
          ref
              .read(searchHistoryRepositoryProvider)
              .removeSearchItem(assetPath: assetPath, searchHistoryItem: item);
        },
        icon: const Icon(Icons.remove));
  }
}
