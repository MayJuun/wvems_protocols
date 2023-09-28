// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_messages_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appMessagesRepositoryHash() =>
    r'ac4d6432fd63b42961c36de26a80e95a6b65f6b2';

/// See also [appMessagesRepository].
@ProviderFor(appMessagesRepository)
final appMessagesRepositoryProvider = Provider<AppMessagesRepository>.internal(
  appMessagesRepository,
  name: r'appMessagesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appMessagesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppMessagesRepositoryRef = ProviderRef<AppMessagesRepository>;
String _$appMessagesHash() => r'c0e41bdb690fd2d26fd12cb93b5c4ceedbe21841';

/// See also [appMessages].
@ProviderFor(appMessages)
final appMessagesProvider = StreamProvider<List<AppMessage>>.internal(
  appMessages,
  name: r'appMessagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppMessagesRef = StreamProviderRef<List<AppMessage>>;
String _$unreadAppMessagesHash() => r'66f30558e0e71e729e2478b11103f22f61b09b5d';

/// See also [unreadAppMessages].
@ProviderFor(unreadAppMessages)
final unreadAppMessagesProvider =
    AutoDisposeProvider<List<AppMessage>>.internal(
  unreadAppMessages,
  name: r'unreadAppMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unreadAppMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UnreadAppMessagesRef = AutoDisposeProviderRef<List<AppMessage>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
