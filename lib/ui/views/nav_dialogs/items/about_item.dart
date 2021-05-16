import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/shared/shared.dart';

class AboutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NavIcon(Icons.info),
      title: Text(S.NAV_ABOUT),
      subtitle: Text('Release ${S.APP_RELEASE}'),
      onTap: () => displayAboutDialog(context),
    );
  }
}

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
      children: <Widget>[
        const Gap(24),
        Row(
          children: [
            Text(S.NAV_ABOUT_RELEASE),
            const Gap(48),
            Text(S.APP_RELEASE),
          ],
        ),
        const Gap(24),
        Text(
          S.APP_COPYRIGHT,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
