import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:quick_reference/ui/strings.dart';
import 'package:quick_reference/ui/styled_components/styled_components.dart';
import 'package:quick_reference/ui/views/nav_dialogs/share_dialog/share_options.dart';
import 'package:quick_reference/ui/views/nav_dialogs/share_dialog/share_qr_code.dart';
import 'package:quick_reference/ui/views/nav_dialogs/shared/shared.dart';

// The action items for the currently displayed version. Share and Print
// both fire a dialog to ask if the user wants to act on just the single
// displayed page, or if they want to act on the whole document.
void displayShareDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) => _ShareDialog(),
  );
}

class _ShareDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledDialog(
      hasOkButton: false,
      title: S.NAV_SHARE,
      subtitle: S.NAV_SHARE_SUBTITLE,
      children: const <Widget>[
        Gap(8),
        ShareOptions(),
        Gap(8),
        NavDivider(),
        Gap(8),
        ShareQrCode(),
        Gap(12)
      ],
    );
  }
}
