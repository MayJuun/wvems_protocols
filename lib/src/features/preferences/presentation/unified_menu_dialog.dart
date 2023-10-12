import 'package:flutter/material.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

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
                const MessageScreenSmall(
                  shouldExpandWidget: true,
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
                  child: Scrollbar(
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
                ),
              ],
            ),
    );
  }
}
