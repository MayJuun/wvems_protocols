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
String _$pdfSearchStateFilterHash() =>
    r'ae36d2a1f7dae438b93e45e0d12f4eb5a83d1894';

/// See also [PdfSearchStateFilter].
@ProviderFor(PdfSearchStateFilter)
final pdfSearchStateFilterProvider = AutoDisposeNotifierProvider<
    PdfSearchStateFilter, PdfSearchFilters>.internal(
  PdfSearchStateFilter.new,
  name: r'pdfSearchStateFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfSearchStateFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PdfSearchStateFilter = AutoDisposeNotifier<PdfSearchFilters>;
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
String _$pdfSearchFilterHash() => r'001a01eefaec070575f2c95db31edb178fa46f62';

/// See also [PdfSearchFilter].
@ProviderFor(PdfSearchFilter)
final pdfSearchFilterProvider =
    NotifierProvider<PdfSearchFilter, PdfSearchFilters>.internal(
  PdfSearchFilter.new,
  name: r'pdfSearchFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfSearchFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PdfSearchFilter = Notifier<PdfSearchFilters>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
