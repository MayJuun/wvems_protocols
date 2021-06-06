import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/settings_dialog/more_info.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/shared/shared.dart';
import 'display_mode.dart';
import 'protocol_version.dart';

// Select customization options, such as light/dark theme and version number
void displaySettingsDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) => _SettingsDialog(),
  );
}

class _SettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledDialog(
      title: S.NAV_SETTINGS,
      hasOkButton: false,
      children: const <Widget>[
        ProtocolVersion(),
        Gap(12),
        NavDivider(),
        Gap(8),
        DisplayMode(),
        NavDivider(),
        Gap(8),
        MoreInfo(),
      ],
    );
  }
}
