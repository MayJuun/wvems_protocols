import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'firebase_messaging_repository.g.dart';

class FirebaseMessagingRepository {
  final _remoteMessage = InMemoryStore<RemoteMessage?>(null);

  Future<RemoteMessage?> fetchLastMessage() async => _remoteMessage.value;
  Stream<RemoteMessage?> watchMessages() => _remoteMessage.stream;

  void addRemoteMessage(RemoteMessage? message) {
    debugPrint('saving message: ${message?.messageId}');
    _remoteMessage.value = message;
  }
}

@Riverpod(keepAlive: true)
FirebaseMessagingRepository firebaseMessagingRepository(
  FirebaseMessagingRepositoryRef ref,
) =>
    throw UnimplementedError();

@Riverpod(keepAlive: true)
Stream<RemoteMessage?> remoteMessage(RemoteMessageRef ref) =>
    ref.watch(firebaseMessagingRepositoryProvider).watchMessages();
