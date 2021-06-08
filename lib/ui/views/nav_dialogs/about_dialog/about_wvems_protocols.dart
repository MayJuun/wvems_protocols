import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wvems_protocols/ui/strings.dart';

class AboutWvemsProtocols extends StatelessWidget {
  const AboutWvemsProtocols({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.NAV_ABOUT_RELEASE),
            Text(S.APP_RELEASE),
          ],
        ),
        const Gap(12),
        Text(
          S.APP_COPYRIGHT,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
