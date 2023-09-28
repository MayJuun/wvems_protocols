import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:wvems_protocols/wvems_protocols.dart';

class MessageItemDetailed extends ConsumerWidget {
  const MessageItemDetailed(this.appMessage, {super.key});

  final AppMessage appMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRead = appMessage.beenRead;
    // final appMessage = ref.watch(appMessagesProvider)
    return ResponsiveDialogWidget(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuHeader(label: appMessage.title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Divider(),
                  // gapH8,
                  Text(appMessage.body),
                  gapH32,
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Sent: '.hardcoded + timeago.format(appMessage.dateTime),
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
      ),
    );
  }
}
