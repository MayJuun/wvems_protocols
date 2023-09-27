// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_search_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pdfSearchResultsTableOfContentsHash() =>
    r'adb07c74ef155d2e6f90f6a5e6a84b063445ef8a';

/// See also [pdfSearchResultsTableOfContents].
@ProviderFor(pdfSearchResultsTableOfContents)
final pdfSearchResultsTableOfContentsProvider =
    AutoDisposeProvider<Map<int, String>>.internal(
  pdfSearchResultsTableOfContents,
  name: r'pdfSearchResultsTableOfContentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfSearchResultsTableOfContentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PdfSearchResultsTableOfContentsRef
    = AutoDisposeProviderRef<Map<int, String>>;
String _$pdfSearchResultsPageTextHash() =>
    r'5b1519dbd214103b9e1db334e997913b988ea290';

/// See also [pdfSearchResultsPageText].
@ProviderFor(pdfSearchResultsPageText)
final pdfSearchResultsPageTextProvider =
    AutoDisposeProvider<Map<int, PageTextResult>>.internal(
  pdfSearchResultsPageText,
  name: r'pdfSearchResultsPageTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfSearchResultsPageTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PdfSearchResultsPageTextRef
    = AutoDisposeProviderRef<Map<int, PageTextResult>>;
String _$pdfSearchResultsForSearchHistoryHash() =>
    r'99970d19626b96ed5bb028748e5bcdbd6f2e06d1';

/// See also [pdfSearchResultsForSearchHistory].
@ProviderFor(pdfSearchResultsForSearchHistory)
final pdfSearchResultsForSearchHistoryProvider =
    AutoDisposeProvider<List<SearchHistoryItem>>.internal(
  pdfSearchResultsForSearchHistory,
  name: r'pdfSearchResultsForSearchHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfSearchResultsForSearchHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PdfSearchResultsForSearchHistoryRef
    = AutoDisposeProviderRef<List<SearchHistoryItem>>;
String _$pdfSearchStateHash() => r'38859b3134313e1f410332dfe87ffc57d5225ffd';

/// Automatically update displayed content based on search results above + query
///
/// Copied from [PdfSearchState].
@ProviderFor(PdfSearchState)
final pdfSearchStateProvider =
    AutoDisposeNotifierProvider<PdfSearchState, String>.internal(
  PdfSearchState.new,
  name: r'pdfSearchStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfSearchStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PdfSearchState = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
