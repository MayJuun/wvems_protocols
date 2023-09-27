import 'package:flutter/material.dart';

import '../../../../../wvems_protocols.dart';

class ResponsiveDialogWidget extends StatelessWidget {
  const ResponsiveDialogWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isPortrait =
              MediaQuery.of(context).orientation == Orientation.portrait;
          final bool isAboveBreakpoint =
              constraints.maxWidth >= Breakpoint.tablet;

          return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: (isAboveBreakpoint || !isPortrait)
                    ? double.infinity
                    : MediaQuery.of(context).size.height - 256,
                maxWidth: isAboveBreakpoint ? 600 : double.infinity,
              ),
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: child));
        },
      ),
    );
  }
}
