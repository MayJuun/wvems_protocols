import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:wvems_protocols/wvems_protocols.dart';

class MessageItemDetailed extends ConsumerWidget {
  const MessageItemDetailed(this.messageId, {super.key});

  final String? messageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appMessagesValue = ref.watch(appMessagesProvider);
    return ResponsiveDialogWidget(
      child: AsyncValueWidget<List<AppMessage>>(
        value: appMessagesValue,
        data: (appMessages) {
          final appMessage = appMessages.firstWhereOrNull(
            (message) => message.messageId == messageId,
          );

          if (appMessage == null || messageId == null) {
            return const Center(child: Text('Message not found'));
          }

          final isRead = appMessage.isRead;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MenuHeader(label: appMessage.title),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Divider(),
                      Text(appMessage.body),
                      gapH32,
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Sent: '.hardcoded +
                              timeago.format(appMessage.dateTime),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          DateFormat('yyyy-MM-dd – HH:mm')
                              .format(appMessage.dateTime.toLocal()),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                MenuFooter(
                  leadingTextButton: TextButton(
                    child: Text('Remove'.hardcoded),
                    onPressed: () {
                      ref
                          .read(appMessagesRepositoryProvider)
                          .removeMessage(appMessage);
                      context.pop();
                    },
                  ),
                  trailingTextButton: TextButton(
                    child: Text(
                      isRead
                          ? 'Mark as Unread'.hardcoded
                          : 'Mark as Read'.hardcoded,
                    ),
                    onPressed: () {
                      ref
                          .read(appMessagesRepositoryProvider)
                          .toggleRead(appMessage);
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
