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
