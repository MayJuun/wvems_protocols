import 'package:flutter/material.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

// const kUnifiedMenuWVEMSKey = Key('unified-menu-wvems-key');
// const kUnifiedMenuMayJuunKey = Key('unified-menu-mayjuun-key');

class UnifiedMenuDialog extends StatelessWidget {
  const UnifiedMenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final isAboveBreakpoint = shortestSide >= Breakpoint.tablet;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return ResponsiveDialogWidget(
      child: (isPortrait || isAboveBreakpoint)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MenuHeader(label: 'WVEMS Protocols'.hardcoded),
                const DisplayVersion(),
                const AppLinks(),
                const Expanded(
                  child: SingleChildScrollView(child: MessageScreenSmall()),
                ),
                const DisplayMode(),
                const MenuFooter(
                  leadingTextButton: TextButtonWVEMS(),
                  trailingTextButton: TextButtonMayJuun(),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MenuHeader(label: 'WVEMS Protocols'.hardcoded),
                const Divider(),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DisplayVersion(),
                        AppLinks(),
                        MessageScreenSmall(),
                        DisplayMode(),
                        MenuFooter(
                          leadingTextButton: TextButtonWVEMS(),
                          trailingTextButton: TextButtonMayJuun(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
