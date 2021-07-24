import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/ui/strings.dart';

class ShareQrCode extends StatelessWidget {
  const ShareQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          S.NAV_SHARE_QR_CODE,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        const Gap(24),
        const SizedBox(
            height: 200,
            child: Image(image: AssetImage(AppAssets.PNG_QR_CODE))),
      ],
    );
  }
}
