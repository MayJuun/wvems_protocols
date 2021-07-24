import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/messages_dialog/read_messages.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/messages_dialog/unread_messages.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/shared/shared.dart';

// The action items for the currently displayed version. Share and Print
// both fire a dialog to ask if the user wants to act on just the single
// displayed page, or if they want to act on the whole document.
void displayMessagesDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) => _MessagesDialog(),
  );
}

class _MessagesDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledDialog(
      hasOkButton: false,
      title: S.NAV_MESSAGES,
      children: const <Widget>[
        _ToggleReadUnreadInfo(),
        Gap(24),
        UnreadMessages(),
        Gap(8),
        NavDivider(),
        Gap(8),
        ReadMessages(),
        Gap(8)
      ],
    );
  }
}

class _ToggleReadUnreadInfo extends StatelessWidget {
  const _ToggleReadUnreadInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'click to toggle read/unread',
      textAlign: TextAlign.end,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .apply(fontStyle: FontStyle.italic),
    );
  }
}
