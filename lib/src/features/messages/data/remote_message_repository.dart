import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'remote_message_repository.g.dart';

class RemoteMessageRepository {
  RemoteMessageRepository({this.addDelay = false});

  final bool addDelay;
  final _lastMessage = InMemoryStore<RemoteMessage?>(null);

  Future<RemoteMessage?> fetchLastMessage() async {
    await delay(addDelay);
    return _lastMessage.value;
  }

  Stream<RemoteMessage?> watchMessage() => _lastMessage.stream;

  Future<void> addMessage(RemoteMessage remoteMessage) async {
    await delay(addDelay);
    _lastMessage.value = remoteMessage;
  }
}

@Riverpod(keepAlive: true)
RemoteMessageRepository remoteMessageRepository(
  RemoteMessageRepositoryRef ref,
) {
  return RemoteMessageRepository();
}
