// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_bundle_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pdfBundleRepositoryHash() =>
    r'12a7f434f506318498a25e4318d2dc7dff23fe05';

/// See also [pdfBundleRepository].
@ProviderFor(pdfBundleRepository)
final pdfBundleRepositoryProvider = Provider<PdfBundleRepository>.internal(
  pdfBundleRepository,
  name: r'pdfBundleRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pdfBundleRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PdfBundleRepositoryRef = ProviderRef<PdfBundleRepository>;
String _$pdfTableOfContentsSearchHash() =>
    r'd686aa11a4747cf57152d3931b7afdcc804aa6ba';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pdfTableOfContentsSearch].
@ProviderFor(pdfTableOfContentsSearch)
const pdfTableOfContentsSearchProvider = PdfTableOfContentsSearchFamily();

/// See also [pdfTableOfContentsSearch].
class PdfTableOfContentsSearchFamily
    extends Family<AsyncValue<Map<int, String>>> {
  /// See also [pdfTableOfContentsSearch].
  const PdfTableOfContentsSearchFamily();

  /// See also [pdfTableOfContentsSearch].
  PdfTableOfContentsSearchProvider call(
    String query,
  ) {
    return PdfTableOfContentsSearchProvider(
      query,
    );
  }

  @override
  PdfTableOfContentsSearchProvider getProviderOverride(
    covariant PdfTableOfContentsSearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pdfTableOfContentsSearchProvider';
}

/// See also [pdfTableOfContentsSearch].
class PdfTableOfContentsSearchProvider
    extends AutoDisposeFutureProvider<Map<int, String>> {
  /// See also [pdfTableOfContentsSearch].
  PdfTableOfContentsSearchProvider(
    String query,
  ) : this._internal(
          (ref) => pdfTableOfContentsSearch(
            ref as PdfTableOfContentsSearchRef,
            query,
          ),
          from: pdfTableOfContentsSearchProvider,
          name: r'pdfTableOfContentsSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pdfTableOfContentsSearchHash,
          dependencies: PdfTableOfContentsSearchFamily._dependencies,
          allTransitiveDependencies:
              PdfTableOfContentsSearchFamily._allTransitiveDependencies,
          query: query,
        );

  PdfTableOfContentsSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<Map<int, String>> Function(PdfTableOfContentsSearchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PdfTableOfContentsSearchProvider._internal(
        (ref) => create(ref as PdfTableOfContentsSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<int, String>> createElement() {
    return _PdfTableOfContentsSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PdfTableOfContentsSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PdfTableOfContentsSearchRef
    on AutoDisposeFutureProviderRef<Map<int, String>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _PdfTableOfContentsSearchProviderElement
    extends AutoDisposeFutureProviderElement<Map<int, String>>
    with PdfTableOfContentsSearchRef {
  _PdfTableOfContentsSearchProviderElement(super.provider);

  @override
  String get query => (origin as PdfTableOfContentsSearchProvider).query;
}

String _$pdfTextSearchHash() => r'57da722dfe2b586651b59d446e8a708f9afbbe5b';

/// See also [pdfTextSearch].
@ProviderFor(pdfTextSearch)
const pdfTextSearchProvider = PdfTextSearchFamily();

/// See also [pdfTextSearch].
class PdfTextSearchFamily extends Family<AsyncValue<Map<int, String>>> {
  /// See also [pdfTextSearch].
  const PdfTextSearchFamily();

  /// See also [pdfTextSearch].
  PdfTextSearchProvider call(
    String query,
  ) {
    return PdfTextSearchProvider(
      query,
    );
  }

  @override
  PdfTextSearchProvider getProviderOverride(
    covariant PdfTextSearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pdfTextSearchProvider';
}

/// See also [pdfTextSearch].
class PdfTextSearchProvider
    extends AutoDisposeFutureProvider<Map<int, String>> {
  /// See also [pdfTextSearch].
  PdfTextSearchProvider(
    String query,
  ) : this._internal(
          (ref) => pdfTextSearch(
            ref as PdfTextSearchRef,
            query,
          ),
          from: pdfTextSearchProvider,
          name: r'pdfTextSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pdfTextSearchHash,
          dependencies: PdfTextSearchFamily._dependencies,
          allTransitiveDependencies:
              PdfTextSearchFamily._allTransitiveDependencies,
          query: query,
        );

  PdfTextSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<Map<int, String>> Function(PdfTextSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PdfTextSearchProvider._internal(
        (ref) => create(ref as PdfTextSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<int, String>> createElement() {
    return _PdfTextSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PdfTextSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PdfTextSearchRef on AutoDisposeFutureProviderRef<Map<int, String>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _PdfTextSearchProviderElement
    extends AutoDisposeFutureProviderElement<Map<int, String>>
    with PdfTextSearchRef {
  _PdfTextSearchProviderElement(super.provider);

  @override
  String get query => (origin as PdfTextSearchProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
