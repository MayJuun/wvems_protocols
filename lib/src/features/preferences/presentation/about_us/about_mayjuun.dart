import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../wvems_protocols.dart';

class AboutMayJuun extends StatelessWidget {
  const AboutMayJuun({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ResponsiveDialogWidget(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuHeader(label: 'About MayJuun'.hardcoded),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Image.asset(isDarkMode
                      ? AppAssets.MAYJUUN_LOGO_DARK
                      : AppAssets.MAYJUUN_LOGO_LIGHT),
                  gapH16,
                  Text(
                    'Founded by clinicians, MayJuun develops customized and effective healthcare apps so more time can be spent focused on patients and their care.'
                        .hardcoded,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  gapH8,
                  Text(
                    'We believe that lowering the barriers to entry – both technical and monetary – will allow for innovation, broader applications, and the ability to use technology to improve people\'s lives.'
                        .hardcoded,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  gapH8,
                  Text(
                    'As practicing clinicians, we understand the need for accurate and actionable data to be balanced with workflows, minimizing unnecessary steps and extra clicks.'
                        .hardcoded,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  gapH16,
                  AboutUsHyperlink(
                      label: 'https://mayjuun.com',
                      uri: Uri.parse('https://mayjuun.com')),
                  const Divider(),
                ],
              ),
            ),
            const MenuFooter(
              leadingTextButton: TextButtonSettings(),
              trailingTextButton: TextButtonWVEMS(),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsHyperlink extends StatelessWidget {
  const AboutUsHyperlink({super.key, required this.label, required this.uri});

  final String label;
  final Uri uri;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return RichText(
        text: TextSpan(
      text: label,
      style: textTheme.bodyMedium!.apply(
        color: colorScheme.primary,
        fontStyle: FontStyle.italic,
        // decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = () => print('click'),
    ));
  }
}
