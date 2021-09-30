import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';
import 'package:wvems_protocols/ui/strings.dart';

class AboutMayJuun extends StatelessWidget {
  const AboutMayJuun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          S.NAV_ABOUT_MAYJUUN,
          style: Theme.of(context).textTheme.headline6,
        ),
        const Gap(12),
        Text(
          S.NAV_ABOUT_MAYJUUN_INFO,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const Gap(12),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              _RichSpanLink(
                  S.NAV_ABOUT_MAYJUUN_SITE, S.NAV_ABOUT_MAYJUUN_SITE, context)
            ])),
        const Gap(12),
      ],
    );
  }
}

class _RichSpanLink extends TextSpan {
  _RichSpanLink(String data, String url, BuildContext context)
      : super(
          text: data,
          style: context.textTheme.bodyText2?.apply(
            color: (context.isDarkMode)
                ? context.theme.colorScheme.secondary
                : ColorUtil().darken(context.theme.colorScheme.primaryVariant),
            // color: ColorUtil().lightenOrDarken(
            //     Theme.of(context).colorScheme.primary,
            //     Theme.of(context).brightness,
            //     0.2),
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async => await LaunchUrlCommand().execute(url: url),
        );
}
