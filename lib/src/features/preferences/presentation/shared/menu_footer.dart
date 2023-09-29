import 'package:flutter/material.dart';

class MenuFooter extends StatelessWidget {
  const MenuFooter({
    required this.leadingTextButton,
    required this.trailingTextButton,
    super.key,
  });

  final Widget leadingTextButton;
  final Widget trailingTextButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: leadingTextButton),
        const Icon(Icons.circle, size: 6),
        Expanded(child: trailingTextButton),
      ],
    );
  }
}
