import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

class ResultsHeader extends SliverPersistentHeaderDelegate {
  const ResultsHeader();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        children:
            PdfSearchFilters.values.map((e) => ResultFilterItem(e)).toList(),
      ),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class ResultFilterItem extends ConsumerWidget {
  const ResultFilterItem(this.pdfSearchFilter, {super.key});

  final PdfSearchFilters pdfSearchFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSearchFilter = ref.watch(pdfSearchFilterProvider);
    late final int searchQuantity;
    switch (pdfSearchFilter) {
      case PdfSearchFilters.tableOfContents:
        searchQuantity =
            ref.watch(pdfSearchResultsTableOfContentsProvider).length;
      case PdfSearchFilters.pageText:
        searchQuantity = ref.watch(pdfSearchResultsPageTextProvider).length;
      case PdfSearchFilters.history:
        searchQuantity = 0;
      // TODO: Handle this case.
    }

    return Badge.count(
      count: searchQuantity,
      isLabelVisible: searchQuantity > 0,
      offset: const Offset(-8, -2),
      backgroundColor: Theme.of(context).colorScheme.primary,
      largeSize: 16,
      child: FilterChip(
        label: Text(pdfSearchFilter.label.hardcoded),
        selected: activeSearchFilter == pdfSearchFilter,
        onSelected: (isSelected) {
          if (isSelected) {
            ref
                .read(pdfSearchFilterProvider.notifier)
                .setFilter(pdfSearchFilter);
          }
        },
      ),
    );
  }
}
