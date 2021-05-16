import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

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
    final ThemeController themeService = Get.find();

    return StyledDialog(
      title: S.NAV_SETTINGS,
      subtitle: S.NAV_DISPLAY_MODE,
      hasOkButton: false,
      children: <Widget>[
        const Gap(12),
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
        Divider(
          color: Theme.of(context).accentColor,
          thickness: 1,
        ),
        const Gap(8),
        Text(
          'Select protocol version',
          textAlign: TextAlign.center,
          style: context.textTheme.headline6,
        ),
        const Gap(8),
        const _ProtocolVersionItem(
          title: '2021 WVEMS Protocols',
        ),
        const _ProtocolVersionItem(
          title: '2020 WVEMS Protocols',
        ),
        const _ProtocolVersionItem(
          title: '2019 WVEMS Protocols',
        ),
      ],
    );
  }
}

class _ProtocolVersionItem extends StatelessWidget {
  const _ProtocolVersionItem({Key? key, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        highlightColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed ?? () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Mdi.checkboxBlankCircleOutline),
                          Icon(Mdi.cloudDownloadOutline),
                          Icon(Mdi.shareVariant),
                          Icon(Mdi.dotsVertical),
                        ]),
                  ),
                  Flexible(
                    child: Text(
                      '20 mb',
                      textAlign: TextAlign.end,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.apply(color: Theme.of(context).disabledColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
