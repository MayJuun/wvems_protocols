import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:quick_reference/ui/strings.dart';
import 'package:quick_reference/ui/styled_components/styled_components.dart';
import 'package:quick_reference/ui/views/nav_dialogs/settings_dialog/more_info.dart';
import 'package:quick_reference/ui/views/nav_dialogs/shared/shared.dart';
import 'display_mode.dart';

// Select customization options, such as light/dark theme and version number
void displaySettingsDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) => StyledDialog(
      title: S.NAV_SETTINGS,
      hasOkButton: false,
      children: const <Widget>[
        NavDivider(),
        Gap(8),
        DisplayMode(),
        NavDivider(),
        Gap(8),
        MoreInfo(),
      ],
    ),
  );
}
