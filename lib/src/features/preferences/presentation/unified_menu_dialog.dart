import 'package:flutter/material.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

// const kUnifiedMenuWVEMSKey = Key('unified-menu-wvems-key');
// const kUnifiedMenuMayJuunKey = Key('unified-menu-mayjuun-key');

class UnifiedMenuDialog extends StatelessWidget {
  const UnifiedMenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveDialogWidget(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuHeader(label: 'WVEMS Protocols'.hardcoded),
            const DisplayVersion(),
            const AppLinks(),
            const MessageScreenSmall(),
            const DisplayMode(),
            const MenuFooter(
              leadingTextButton: TextButtonWVEMS(),
              trailingTextButton: TextButtonMayJuun(),
            ),
          ],
        ),
      ),
    );
  }
}
