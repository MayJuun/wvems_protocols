import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../../wvems_protocols.dart';

class AppLinks extends StatelessWidget {
  const AppLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ShareOption(
              title: 'App Link'.hardcoded,
              icon: Mdi.tabletCellphone,
              onPressed: () async {
                // todo: share link
              }),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 16.0,
            ),
            child: Image(image: AssetImage(AppAssets.PNG_QR_CODE)),
          )),
          _ShareOption(
              title: 'PDF Link'.hardcoded,
              icon: Mdi.pdfBox,
              onPressed: () async {
                // todo: share PDF
              }),
        ],
      ),
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
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkResponse(
          onTap: onPressed,
          child: Text(
            title,
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(icon: Icon(icon), iconSize: 44, onPressed: onPressed),
      ],
    );
  }
}
