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
    r'893540d94e4052aa7eb89f7d9159c003237005fc';

/// See also [pdfSearchResultsPageText].
@ProviderFor(pdfSearchResultsPageText)
final pdfSearchResultsPageTextProvider =
    AutoDisposeProvider<Map<int, String>>.internal(
  pdfSearchResultsPageText,
  name: r'pdfSearchResultsPageTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfSearchResultsPageTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PdfSearchResultsPageTextRef = AutoDisposeProviderRef<Map<int, String>>;
String _$pdfSearchStateFilterHash() =>
    r'3d59e4f948f0a1f3abe8a878de932d0f491e509d';

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
String _$pdfSearchStateHash() => r'd392b4679e52a79abb93939c55fd518b59ff6fde';

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
