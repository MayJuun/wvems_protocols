import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/dialogs.dart';

class HomeBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MessagingController messagingController = Get.find();

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: const Alignment(0.6, -.7),
                children: <Widget>[
                  // const NavIcon(Icons.message),
                  Obx(
                    () => Icon(
                      Icons.circle,
                      size: 12.0,
                      color: Theme.of(context)
                          .primaryColor

                          // withAlpha used for Obx, so stream will always be called
                          // if empty, opacity is 0%, else 100%
                          .withAlpha(
                              messagingController.hasNewMessage() ? 255 : 0),
                    ),
                  ),
                  _Button(
                    label: S.NAV_MESSAGES,
                    icon: messagingController.hasNewMessage()
                        ? Mdi.emailOpen
                        : Mdi.email,
                    onPressed: () => displayMessagesDialog(context),
                  ),
                ],
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
            ],
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 30.0),
      ),
    );
  }
}
