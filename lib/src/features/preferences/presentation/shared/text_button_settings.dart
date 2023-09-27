import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../wvems_protocols.dart';

class TextButtonSettings extends StatelessWidget {
  const TextButtonSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // key: kUnifiedMenuKey,
      child: Text('Settings'.hardcoded),
      onPressed: () {
        context.pop();
        context.pushNamed(AppRoute.menu.name);
      },
    );
  }
}
