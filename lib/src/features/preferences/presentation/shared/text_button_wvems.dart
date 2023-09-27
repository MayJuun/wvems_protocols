import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../wvems_protocols.dart';

class TextButtonWVEMS extends StatelessWidget {
  const TextButtonWVEMS({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // key: kUnifiedMenuWVEMSKey,
      child: Text('About WVEMS'.hardcoded),
      onPressed: () {
        context.pop();
        context.pushNamed(AppRoute.aboutWVEMS.name);
      },
    );
  }
}
