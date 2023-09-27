import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'app_messages_repository.g.dart';

class AppMessagesRepository {
  AppMessagesRepository({this.addDelay = false});

  final bool addDelay;
  final _appMessages = InMemoryStore<List<AppMessage>>([]);

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
}

@Riverpod(keepAlive: true)
AppMessagesRepository appMessagesRepository(AppMessagesRepositoryRef ref) {
  return AppMessagesRepository();
}
