// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_messaging_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseMessagingServiceHash() =>
    r'7aaaf9d0abc4823d42b7592b14853f59e427a0f0';

/// See also [firebaseMessagingService].
@ProviderFor(firebaseMessagingService)
final firebaseMessagingServiceProvider =
    Provider<FirebaseMessagingService>.internal(
  firebaseMessagingService,
  name: r'firebaseMessagingServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseMessagingServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseMessagingServiceRef = ProviderRef<FirebaseMessagingService>;
String _$remoteMessageHash() => r'cb288992fe92e758bf95938ec03e728e16fa991f';

/// See also [remoteMessage].
@ProviderFor(remoteMessage)
final remoteMessageProvider = StreamProvider<RemoteMessage?>.internal(
  remoteMessage,
  name: r'remoteMessageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RemoteMessageRef = StreamProviderRef<RemoteMessage?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
