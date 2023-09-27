import 'package:flutter/material.dart';

import '../../../../../wvems_protocols.dart';

class AboutWVEMS extends StatelessWidget {
  const AboutWVEMS({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ResponsiveDialogWidget(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuHeader(label: 'About WVEMS'.hardcoded),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Image.asset(isDarkMode
                      ? AppAssets.PNG_LOGO_DARK
                      : AppAssets.PNG_LOGO_LIGHT),
                  gapH16,
                  Text(
                    'These protocols are published under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License. You are free to: share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material for any purpose, even commercially) under the following terms: attribution (you must give appropriate credit, provide a link to the license, and indicate if changes were made - you may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use) and sharealike (if you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original with no additional restrictions). You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits. Visit creativecommons.org/licenses/by-sa/4.0 for details.'
                        .hardcoded,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  gapH16,
                  AboutUsHyperlink(
                      label: 'https://western.vaems.org',
                      uri: Uri.parse('https://western.vaems.org')),
                  const Divider(),
                ],
              ),
            ),
            const MenuFooter(
              leadingTextButton: TextButtonSettings(),
              trailingTextButton: TextButtonMayJuun(),
            ),
          ],
        ),
      ),
    );
  }
}
