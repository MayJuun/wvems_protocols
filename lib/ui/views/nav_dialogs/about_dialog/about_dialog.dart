import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:quick_reference/ui/strings.dart';
import 'package:quick_reference/ui/styled_components/styled_components.dart';
import 'package:quick_reference/ui/views/nav_dialogs/about_dialog/about_may_juun.dart';
import 'package:quick_reference/ui/views/nav_dialogs/about_dialog/about_quick_reference.dart';
import 'package:quick_reference/ui/views/nav_dialogs/shared/shared.dart';

// pop-op dialog for "About"
void displayAboutDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) => _AboutDialog(),
  );
}

class _AboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledDialog(
      title: S.NAV_ABOUT,
      subtitle: S.NAV_ABOUT_SUBTITLE,
      hasOkButton: false,
      children: const <Widget>[
        Gap(12),
        AboutQuickReference(),
        Gap(12),
        NavDivider(),
        Gap(8),
        AboutMayJuun(),
      ],
    );
  }
}
