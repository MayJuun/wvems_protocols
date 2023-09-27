import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class TextButtonSettings extends StatelessWidget {
  const TextButtonSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // key: kUnifiedMenuKey,
      child: Text('Settings'.hardcoded),
      onPressed: () {
        context
          ..pop()
          ..pushNamed(AppRoute.menu.name);
      },
    );
  }
}
