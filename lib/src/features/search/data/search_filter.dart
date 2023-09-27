import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

part 'search_filter.g.dart';

/// For the search bar, this decides what content should be displayed
enum PdfSearchFilters {
  tableOfContents('Table Of Contents'),
  pageText('Page Text'),
  history('History');

  const PdfSearchFilters(this.label);

  final String label;
}

@Riverpod(keepAlive: true)
class SearchFilter extends _$SearchFilter {
  @override
  PdfSearchFilters build() {
    final searchFilter =
        ref.watch(sharedPreferencesRepositoryProvider).getSearchFilter();
    return searchFilter;
  }

  void setFilter(PdfSearchFilters pdfSearchFilter) => state = pdfSearchFilter;
}
