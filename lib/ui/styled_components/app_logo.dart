import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_reference/assets.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Image(
        image: AssetImage((context.theme.brightness == Brightness.dark)
            ? AppAssets.PNG_LOGO_DARK
            : AppAssets.PNG_LOGO_LIGHT),
      ),
    );
  }
}

class DrawerAppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLogo();
  }
}
