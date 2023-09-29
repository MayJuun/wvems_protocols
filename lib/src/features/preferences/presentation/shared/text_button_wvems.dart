import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class TextButtonWVEMS extends StatelessWidget {
  const TextButtonWVEMS({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // key: kUnifiedMenuWVEMSKey,
      child: Text(
        'About WVEMS'.hardcoded,
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        context
          ..pop()
          ..pushNamed(AppRoute.aboutWVEMS.name);
      },
    );
  }
}
