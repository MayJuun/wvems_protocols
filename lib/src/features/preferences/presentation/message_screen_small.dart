import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class MessageScreenSmall extends ConsumerWidget {
  const MessageScreenSmall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appMessagesValue = ref.watch(appMessagesProvider);
    return AsyncValueWidget<List<AppMessage>>(
      value: appMessagesValue,
      data: (appMessages) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: appMessages.map(MessageItem.new).toList(),
        );
      },
    );
  }
}

class MessageItem extends ConsumerWidget {
  const MessageItem(this.appMessage, {super.key});

  final AppMessage appMessage;

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRead = appMessage.beenRead;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final messageReadColor = Theme.of(context).disabledColor;
    final messageUnreadColor = colorScheme.primary;
    final fontStyle = isRead ? FontStyle.italic : null;

    return ListTile(
      leading: IconButton(
        onPressed: () =>
            ref.read(appMessagesRepositoryProvider).toggleRead(appMessage),
        visualDensity: VisualDensity.compact,
        icon: Icon(
          isRead ? Icons.mark_email_read_outlined : Icons.mark_email_unread,
        ),
      ),
      title: Text(
        appMessage.title,
        textAlign: TextAlign.center,
        softWrap: true,
        style: textTheme.bodyMedium!.apply(
          decoration: TextDecoration.underline,
          fontStyle: fontStyle,
          color: isRead ? messageReadColor : messageUnreadColor,
        ),
      ),
      subtitle: Text(
        appMessage.body,
        softWrap: true,
        style: textTheme.bodyMedium!.apply(
          fontStyle: fontStyle,
          color: isRead ? messageReadColor : colorScheme.onBackground,
        ),
      ),
      onTap: () {
        // open message
      },
      onLongPress: () =>
          ref.read(appMessagesRepositoryProvider).toggleRead(appMessage),
    );
  }
}
