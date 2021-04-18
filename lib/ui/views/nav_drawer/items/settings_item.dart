import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/shared/shared.dart';

// Select customization options, such as light/dark theme
class SettingsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NavIcon(Icons.settings),
      title: Text(S.NAV_SETTINGS),
      subtitle: Text(S.NAV_DISPLAY_MODE),
      onTap: () => _displaySettingsDialog(context),
    );
  }
}

// pop-op dialog for "Settings"
void _displaySettingsDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final ThemeController themeService = Get.find();

      return StyledDialog(
        title: Text(S.NAV_MODE_SELECT),
        children: <Widget>[
          RadioListTile(
            title: Text(S.NAV_MODE_LIGHT),
            value: ThemeMode.light,
            groupValue: themeService.themeMode,
            onChanged: (value) => themeService.setThemeMode(ThemeMode.light),
          ),
          RadioListTile(
            title: Text(S.NAV_MODE_DARK),
            value: ThemeMode.dark,
            groupValue: themeService.themeMode,
            onChanged: (value) => themeService.setThemeMode(ThemeMode.dark),
          ),
          RadioListTile(
            title: Text(S.NAV_MODE_SYSTEM),
            value: ThemeMode.system,
            groupValue: themeService.themeMode,
            onChanged: (value) => themeService.setThemeMode(ThemeMode.system),
          ),
          const Divider(
            color: Colors.black38,
            thickness: 1,
          ),
          TextButton(
            child: Text(S.NAV_OK),
            onPressed: () => Get.back(),
          ),
        ],
      );
    },
  );
}
