import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mdi/mdi.dart';
import 'package:share/share.dart';

class ShareOptions extends StatelessWidget {
  const ShareOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              'This app is great! Download here: https://onelink.to/xu9aq8'),
        ),
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
