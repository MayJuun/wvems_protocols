import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class MessageScreenSmall extends ConsumerWidget {
  const MessageScreenSmall({this.shouldExpandWidget = false, super.key});

  final bool shouldExpandWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appMessagesValue = ref.watch(appMessagesProvider);
    return AsyncValueWidget<List<AppMessage>>(
      value: appMessagesValue,
      data: (appMessages) {
        if (appMessages.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return shouldExpandWidget
              ? Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: AppMessagesBuilder(appMessages: appMessages),
                    ),
                  ),
                )
              : AppMessagesBuilder(appMessages: appMessages);
        }
      },
    );
  }
}

class AppMessagesBuilder extends StatelessWidget {
  const AppMessagesBuilder({required this.appMessages, super.key});

  final List<AppMessage> appMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: appMessages.map(MessageItem.new).toList(),
    );
  }
}
