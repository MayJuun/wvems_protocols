import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wvems_protocols/ui/strings.dart';

class AboutMayJuun extends StatelessWidget {
  const AboutMayJuun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          S.NAV_ABOUT_MAYJUUN,
          style: Theme.of(context).textTheme.headline6,
        ),
        const Gap(12),
        Text(
          S.NAV_ABOUT_MAYJUUN_INFO,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const Gap(12),
      ],
    );
  }
}
