import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';

class DisplayMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeService = Get.find();

    return Column(
      mainAxisSize: MainAxisSize.min,
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
        )
      ],
    );
  }
}
