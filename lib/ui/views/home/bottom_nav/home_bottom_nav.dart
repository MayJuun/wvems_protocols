import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/dialogs.dart';

class HomeBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final PdfStateController pdfStateController = Get.find();
    final messagingController = Get.put(MessagingController());
    final unreadMessages = messagingController.unread;
    final readMessages = messagingController.read;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // todo: update UI to show read/unread messages
          _Button(
            label: S.NAV_MESSAGES,
            icon: Mdi.email,
            onPressed: () =>
                displayMessages(context, unreadMessages, readMessages),
          ),
          _Button(
            label: S.NAV_SHARE,
            icon: Mdi.shareVariant,
            onPressed: () => displayShareDialog(context),
          ),
          _Button(
            label: S.NAV_SETTINGS,
            icon: Mdi.cog,
            onPressed: () => displaySettingsDialog(context),
          ),
          const Gap(56),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 36.0), Text(label)],
      ),
    );
  }
}
