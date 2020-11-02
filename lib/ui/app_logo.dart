import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/assets.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset((context.theme.brightness == Brightness.dark)
        ? AppAssets.SVG_LOGO_DARK
        : AppAssets.SVG_LOGO_LIGHT);
  }
}
