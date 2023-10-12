import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class TextButtonMayJuun extends StatelessWidget {
  const TextButtonMayJuun({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // key: kUnifiedMenuMayJuunKey,
      child: Text('About MayJuun'.hardcoded, textAlign: TextAlign.center),
      onPressed: () {
        context
          ..pop()
          ..pushNamed(AppRoute.aboutMayJuun.name);
      },
    );
  }
}
