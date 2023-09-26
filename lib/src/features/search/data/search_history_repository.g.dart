// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchHistoryRepositoryHash() =>
    r'339acef00eb5028a544fbfaa16510bcdc0d925e2';

/// See also [searchHistoryRepository].
@ProviderFor(searchHistoryRepository)
final searchHistoryRepositoryProvider =
    Provider<SearchHistoryRepository>.internal(
  searchHistoryRepository,
  name: r'searchHistoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchHistoryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchHistoryRepositoryRef = ProviderRef<SearchHistoryRepository>;
String _$searchHistoryChangesHash() =>
    r'2044ad8b7bca81db9d0092d78b241b5737348987';

/// See also [searchHistoryChanges].
@ProviderFor(searchHistoryChanges)
final searchHistoryChangesProvider = StreamProvider<SearchHistory>.internal(
  searchHistoryChanges,
  name: r'searchHistoryChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchHistoryChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchHistoryChangesRef = StreamProviderRef<SearchHistory>;
String _$querySearchHistoryItemsHash() =>
    r'127a928d12ce90e7d0419093839582b3dd6297d7';

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

/// See also [querySearchHistoryItems].
@ProviderFor(querySearchHistoryItems)
const querySearchHistoryItemsProvider = QuerySearchHistoryItemsFamily();

/// See also [querySearchHistoryItems].
class QuerySearchHistoryItemsFamily
    extends Family<AsyncValue<List<SearchHistoryItem>>> {
  /// See also [querySearchHistoryItems].
  const QuerySearchHistoryItemsFamily();

  /// See also [querySearchHistoryItems].
  QuerySearchHistoryItemsProvider call(
    String query,
  ) {
    return QuerySearchHistoryItemsProvider(
      query,
    );
  }

  @override
  QuerySearchHistoryItemsProvider getProviderOverride(
    covariant QuerySearchHistoryItemsProvider provider,
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
  String? get name => r'querySearchHistoryItemsProvider';
}

/// See also [querySearchHistoryItems].
class QuerySearchHistoryItemsProvider
    extends AutoDisposeFutureProvider<List<SearchHistoryItem>> {
  /// See also [querySearchHistoryItems].
  QuerySearchHistoryItemsProvider(
    String query,
  ) : this._internal(
          (ref) => querySearchHistoryItems(
            ref as QuerySearchHistoryItemsRef,
            query,
          ),
          from: querySearchHistoryItemsProvider,
          name: r'querySearchHistoryItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$querySearchHistoryItemsHash,
          dependencies: QuerySearchHistoryItemsFamily._dependencies,
          allTransitiveDependencies:
              QuerySearchHistoryItemsFamily._allTransitiveDependencies,
          query: query,
        );

  QuerySearchHistoryItemsProvider._internal(
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
    FutureOr<List<SearchHistoryItem>> Function(
            QuerySearchHistoryItemsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuerySearchHistoryItemsProvider._internal(
        (ref) => create(ref as QuerySearchHistoryItemsRef),
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
  AutoDisposeFutureProviderElement<List<SearchHistoryItem>> createElement() {
    return _QuerySearchHistoryItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuerySearchHistoryItemsProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuerySearchHistoryItemsRef
    on AutoDisposeFutureProviderRef<List<SearchHistoryItem>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _QuerySearchHistoryItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<SearchHistoryItem>>
    with QuerySearchHistoryItemsRef {
  _QuerySearchHistoryItemsProviderElement(super.provider);

  @override
  String get query => (origin as QuerySearchHistoryItemsProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
