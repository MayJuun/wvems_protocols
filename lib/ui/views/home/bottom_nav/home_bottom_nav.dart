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
// Ekey 5/18 - notch removed (the pdf does not extend under the bottom app bar, so the notch just shows empty space)
//    shape: const CircularNotchedRectangle(),

// Ekey 5/18 - not sure if this is strictly necessary... but it defaults to the color of a surface (not the background)
      color: Theme.of(context).backgroundColor,

// Ekey 5/18 - wrapped the bottom nav row() in a column() so that we can add a 1px divider at the top (not that obvious in dark mode, but looks good in light mode)
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Row(
// Ekey 5/18 - removed this alignment to try left justifying the icons to see how they look...
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
// Ekey 5/18 - unnecessary since we're left justifying anyway
//            const Gap(56),
            ],
          ),
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
// Ekey 5/18 - I like the look of the icons without text... but could be convinced otherwise
      child: Icon(icon, size: 30.0)  //google icon size looks about 30
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: [Icon(icon, size: 36.0), Text(label)],
//      ),
    );
  }
}
