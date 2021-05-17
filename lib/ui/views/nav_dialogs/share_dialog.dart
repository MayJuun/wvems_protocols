import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:share/share.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

// The action items for the currently displayed version. Share and Print
// both fire a dialog to ask if the user wants to act on just the single
// displayed page, or if they want to act on the whole document.
void displayShareDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) => _ShareDialog(),
  );
}

class _ShareDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledDialog(
      hasOkButton: false,
      title: S.NAV_SHARE,
      subtitle: S.NAV_SHARE_SUBTITLE,
      children: [
        const Gap(32),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ShareOption(
              title: 'Current\nPage',
              icon: Mdi.fileImage,
              // todo: setup page share as png
              onPressed: () => Share.share(
                  'This app is great! Download here: https://western.vaems.org/'),
            ),
            _ShareOption(
              title: 'Current\nPDF',
              icon: Mdi.pdfBox,
              // todo: setup share as pdf
              onPressed: () => Share.share(
                  'This app is great! Download here: https://western.vaems.org/'),
            ),
            _ShareOption(
              title: 'This App\n(link)',
              icon: Mdi.tabletCellphone,
              // todo: extract string and add android/iOS download locations
              onPressed: () => Share.share(
                  'This app is great! Download here: https://western.vaems.org/'),
            ),
          ],
        ),
        const Gap(24),
      ],
    );
  }
}

class _ShareOption extends StatelessWidget {
  const _ShareOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(icon), iconSize: 44, onPressed: onPressed),
        const Gap(12),
        InkResponse(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(title, textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
