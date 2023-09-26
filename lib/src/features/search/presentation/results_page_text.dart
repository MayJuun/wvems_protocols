import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../wvems_protocols.dart';

class ResultsPageText extends ConsumerWidget {
  const ResultsPageText(this._controller, {super.key});

  final FloatingSearchBarController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(pdfSearchResultsPageTextProvider);

    return DecoratedSliver(
      decoration: const BoxDecoration(),
      sliver: results.isEmpty
          ? const SliverToBoxAdapter(child: SizedBox.shrink())
          : SliverList.separated(
              itemCount: results.length,
              itemBuilder: (_, int index) {
                final item = results.entries.elementAt(index);
                final pageIndex = PagesUtil().pageNumToPageIndex(item.key);

                return PageTextItem(
                  pageId: item.key,
                  pageTextResult: item.value,
                  onPressed: () {
                    /// todo: extract some of this logic out of UI
                    final assetPath =
                        ref.read(pdfBundleProvider).value?.assetPath;

                    assert(assetPath != null);
                    if (assetPath == null) {
                      throw StateError('No asset path available');
                    }
                    ref
                        .read(searchHistoryRepositoryProvider)
                        .onSearchItemSelected(
                            assetPath: assetPath,
                            pageId: item.key,
                            pageTextResult: item.value);

                    _controller.query = item.value.lowerCaseQuery;
                    ref
                        .read(multipageSyncServiceProvider.notifier)
                        .onPageSearch(newPageIndex: pageIndex);
                    _controller.close();
                  },
                );
              },
              separatorBuilder: (_, __) =>
                  const Divider(indent: 8, endIndent: 8),
            ),
    );
  }
}

class PageTextItem extends ConsumerWidget {
  const PageTextItem(
      {required this.pageId,
      required this.pageTextResult,
      required this.onPressed,
      this.trailing,
      super.key});

  final PageId pageId;
  final PageTextResult pageTextResult;
  final VoidCallback onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final tableOfContents = ref.watch(pdfTableOfContentsProvider);
    final pageTitle = tableOfContents.data[pageId] ?? 'Title';

    return ListTile(
      dense: true,
      // trailing: const Text('p4'),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(pageTitle),
          gapW12,
          Text('p. $pageId'),
        ],
      ),
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '...${pageTextResult.before()}',
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            TextSpan(
              text: pageTextResult.lowerCaseQuery,
              style: textTheme.bodyLarge!
                  .apply(fontWeightDelta: 1, fontStyle: FontStyle.italic)
                  .copyWith(color: colorScheme.primary),
            ),
            TextSpan(
              text: '${pageTextResult.after()}...',
              style: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onBackground),
            ),
          ],
        ),
      ),
      onTap: onPressed,
      trailing: trailing,
    );
  }
}
