import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mdi/mdi.dart';
import 'package:share_plus/share_plus.dart';

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
                Share.share(
                    'Download the WVEMS Protocols App, available here: https://onelink.to/xu9aq8'
                        .hardcoded);
                Navigator.of(context).pop();
              }),
          const SizedBox(
              width: 120,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 16.0,
                ),
                child: Image(image: AssetImage(AppAssets.PNG_QR_CODE)),
              )),
          Consumer(builder: (context, ref, child) {
            return _ShareOption(
                title: 'PDF Link'.hardcoded,
                icon: Mdi.pdfBox,
                onPressed: () async {
                  final pdfBundle = ref.read(pdfBundleProvider).value;
                  if (pdfBundle != null) {
                    _onShareXFileFromAssets(context, pdfBundle);
                  }
                });
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

// spec: https://pub.dev/packages/share_plus/example
Future<void> _onShareXFileFromAssets(BuildContext context, PdfBundle pdfBundle,
    [bool showSnackbar = false]) async {
  final box = context.findRenderObject() as RenderBox?;
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  final shareResult = await Share.shareXFiles(
    [
      XFile(
        pdfBundle.pdf.path,
        mimeType: 'application/pdf',
      ),
    ],
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  );

  /// for now, this is used in testing
  if (showSnackbar) {
    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }
}

SnackBar getResultSnackBar(ShareResult result) {
  return SnackBar(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Share PDF link status: ${result.status.name}'.hardcoded),
        if (result.status == ShareResultStatus.success)
          Text('Shared to: ${result.raw}'.hardcoded)
      ],
    ),
  );
}
