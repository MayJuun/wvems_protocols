import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';
import 'package:wvems_protocols/ui/strings.dart';

class ShareOptions extends StatelessWidget {
  const ShareOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ShareOption(
          title: S.NAV_SHARE_SCREEN,
          icon: Mdi.fileImage,
          onPressed: () async {
            await ShareScreenCommand().execute();
            Get.back();
          },
        ),
        _ShareOption(
            title: S.NAV_SHARE_PDF,
            icon: Mdi.pdfBox,
            onPressed: () async {
              await SharePdfCommand().execute();
              Get.back();
            }),
        _ShareOption(
            title: S.NAV_SHARE_LINK,
            icon: Mdi.tabletCellphone,
            // onPressed: () => Share.share(S.NAV_SHARE_LINK_INFO),
            onPressed: () async {
              await ShareLinkCommand().execute();
              Get.back();
            }),
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
