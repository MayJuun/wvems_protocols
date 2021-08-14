import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
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
  final MessagingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => StyledDialog(
        hasOkButton: false,
        title: S.NAV_MESSAGES,
        children: (controller.appMessages.isEmpty)
            ? const <Widget>[Gap(8), Center(child: Text('No messages'))]
            : const <Widget>[
                _ToggleReadUnreadInfo(),
                Gap(24),
                UnreadMessages(),
                Gap(8),
                NavDivider(),
                Gap(8),
                ReadMessages(),
                Gap(8)
              ],
      ),
    );
  }
}

class _ToggleReadUnreadInfo extends StatelessWidget {
  const _ToggleReadUnreadInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const StyledSubtitleText('Click to read / unread'),
        Expanded(child: Container()),
        const Icon(Mdi.delete, size: 18),
        const StyledSubtitleText('= delete'),
      ],
    );
  }
}
