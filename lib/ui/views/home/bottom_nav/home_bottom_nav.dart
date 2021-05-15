import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/items/items.dart';

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
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // todo: update UI to show read/unread messages
            _Button(
              label: 'Messages',
              icon: Mdi.email,
              onPressed: () =>
                  displayMessages(context, unreadMessages, readMessages),
            ),
            _Button(
              label: 'Share',
              icon: Mdi.shareVariant,
              onPressed: () => displayShareDialog(context),
            ),
            _Button(
              label: 'Settings',
              icon: Mdi.cog,
              onPressed: () => displaySettingsDialog(context),
            ),
            const Gap(48),
          ],
        ),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(icon, size: 36.0), onPressed: onPressed),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.apply(color: Theme.of(context).colorScheme.onPrimary),
        )
      ],
    );
  }
}
