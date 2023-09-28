import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'app_messages_repository.g.dart';

class AppMessagesRepository {
  AppMessagesRepository(this._lastAppMessages, {this.addDelay = false});

  final List<AppMessage> _lastAppMessages;
  final bool addDelay;
  late final _appMessages = InMemoryStore<List<AppMessage>>(_lastAppMessages);

  Future<List<AppMessage>> fetchMessages() => Future.value(_appMessages.value);

  Stream<List<AppMessage>> watchMessages() => _appMessages.stream;

  Future<void> setMessages(List<AppMessage> messages) async {
    await delay(addDelay);
    _appMessages.value = messages;
  }

  /// Adds the latest message to the front of the list
  Future<void> addMessage(AppMessage appMessage) async {
    await delay(addDelay);

    if (_appMessages.value.contains(appMessage)) {
      debugPrint('Message already present. Skipped');
      return;
    }

    _appMessages.value = [
      appMessage,
      ..._appMessages.value,
    ];
  }

  Future<void> removeMessage(AppMessage appMessage) async {
    await delay(addDelay);
    final appMessages = _appMessages.value..remove(appMessage);
    _appMessages.value = appMessages;
  }

  Future<void> toggleRead(AppMessage appMessage) async {
    final appMessages = _appMessages.value;
    final newMessages = <AppMessage>[];
    for (final message in appMessages) {
      if (message == appMessage) {
        newMessages.add(appMessage.copyWith(beenRead: !appMessage.beenRead));
      } else {
        newMessages.add(message);
      }
    }
    _appMessages.value = newMessages;
  }
}

@Riverpod(keepAlive: true)
AppMessagesRepository appMessagesRepository(AppMessagesRepositoryRef ref) =>
    throw UnimplementedError();

@Riverpod(keepAlive: true)
Stream<List<AppMessage>> appMessages(AppMessagesRef ref) =>
    ref.watch(appMessagesRepositoryProvider).watchMessages();
