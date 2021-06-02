import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';

class DisplayMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          S.NAV_DISPLAY_MODE,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        const Gap(12),
        RadioListTile(
          title: Text(S.NAV_MODE_LIGHT),
          value: ThemeMode.light,
          groupValue: themeController.themeMode,
          onChanged: (value) => themeController.setThemeMode(ThemeMode.light),
        ),
        RadioListTile(
          title: Text(S.NAV_MODE_DARK),
          value: ThemeMode.dark,
          groupValue: themeController.themeMode,
          onChanged: (value) => themeController.setThemeMode(ThemeMode.dark),
        ),
        RadioListTile(
          title: Text(S.NAV_MODE_SYSTEM),
          value: ThemeMode.system,
          groupValue: themeController.themeMode,
          onChanged: (value) => themeController.setThemeMode(ThemeMode.system),
        )
      ],
    );
  }
}
