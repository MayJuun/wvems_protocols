import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../wvems_protocols.dart';

class TextButtonMayJuun extends StatelessWidget {
  const TextButtonMayJuun({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // key: kUnifiedMenuMayJuunKey,
      child: Text('About MayJuun'.hardcoded),
      onPressed: () {
        context.pop();
        context.pushNamed(AppRoute.aboutMayJuun.name);
      },
    );
  }
}
