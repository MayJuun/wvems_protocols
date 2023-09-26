import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../wvems_protocols.dart';

class ResultsPageText extends ConsumerWidget {
  const ResultsPageText(this._controller, {super.key});

  final FloatingSearchBarController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final results = ref.watch(pdfSearchResultsPageTextProvider);
    final tableOfContents = ref.watch(pdfTableOfContentsProvider);
    return DecoratedSliver(
      decoration: const BoxDecoration(),
      sliver: results.isEmpty
          ? const SliverToBoxAdapter(child: SizedBox.shrink())
          : SliverList.separated(
              itemCount: results.length,
              itemBuilder: (_, int index) {
                final item = results.entries.elementAt(index);
                final pageTitle =
                    tableOfContents.data.entries.elementAt(index).value;
                final pageIndex = PagesUtil().pageNumToPageIndex(item.key);
                return ListTile(
                  dense: true,
                  // trailing: const Text('p4'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(pageTitle),
                      gapW12,
                      Text('p. ${item.key}'),
                    ],
                  ),
                  title: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '...${item.value.before()}',
                          style: textTheme.bodyMedium!
                              .copyWith(color: colorScheme.onBackground),
                        ),
                        TextSpan(
                          text: item.value.lowerCaseQuery,
                          style: const TextStyle(fontWeight: FontWeight.bold)
                              .copyWith(color: colorScheme.primary),
                        ),
                        TextSpan(
                          text: '${item.value.after()}...',
                          style: textTheme.bodyMedium!
                              .copyWith(color: colorScheme.onBackground),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
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
