import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/assets.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3.0, color: Colors.grey)),
      child: SvgPicture.asset((context.theme.brightness == Brightness.dark)
          ? AppAssets.SVG_LOGO_DARK
          : AppAssets.SVG_LOGO_LIGHT),
    );
  }
}

class DrawerAppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:4.0,
      child: Container(
        height: 56.0,
        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3.0, color: Colors.grey)),
        child: SvgPicture.asset(AppAssets.SVG_LOGO_LIGHT, fit: BoxFit.fill),
      ),
    );
  }
}
