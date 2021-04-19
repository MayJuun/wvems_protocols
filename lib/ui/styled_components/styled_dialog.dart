import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class StyledDialog extends StatelessWidget {
  const StyledDialog({
    Key? key,
    required this.title,
    required this.children,
    this.hasOkButton = true,
  }) : super(key: key);

  final Widget title;
  final List<Widget> children;
  final bool hasOkButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: StyledRibbonStack(title: title, children: children),
    );
  }
}
