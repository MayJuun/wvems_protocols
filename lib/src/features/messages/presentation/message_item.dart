import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class MessageItem extends ConsumerWidget {
  const MessageItem(this.appMessage, {super.key});

  final AppMessage appMessage;

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRead = appMessage.isRead;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final messageReadColor = Theme.of(context).disabledColor;
    final messageUnreadColor = colorScheme.primary;
    final fontStyle = isRead ? FontStyle.italic : null;

    return ListTile(
      leading: IconButton(
        onPressed: () => ref
            .read(appMessagesRepositoryProvider)
            .toggleRead(appMessage.messageId),
        visualDensity: VisualDensity.compact,
        icon: Icon(
          isRead ? Icons.mark_email_read_outlined : Icons.mark_email_unread,
        ),
      ),
      title: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Text(
          appMessage.title,
          textAlign: TextAlign.right,
          softWrap: true,
          style: textTheme.bodyMedium!.apply(
            fontStyle: fontStyle,
            color: isRead ? messageReadColor : messageUnreadColor,
          ),
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
        ref
            .read(appMessagesRepositoryProvider)
            .toggleRead(appMessage.messageId, isRead: true);
        context.pushNamed(
          AppRoute.messageItem.name,
          pathParameters: {'messageId': appMessage.messageId},
        );
      },
      onLongPress: () => ref
          .read(appMessagesRepositoryProvider)
          .toggleRead(appMessage.messageId),
    );
  }
}
