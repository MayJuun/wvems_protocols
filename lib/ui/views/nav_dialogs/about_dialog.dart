import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.NAV_ABOUT_RELEASE),
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
