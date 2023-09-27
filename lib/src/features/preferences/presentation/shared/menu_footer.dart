import 'package:flutter/material.dart';

class MenuFooter extends StatelessWidget {
  const MenuFooter(
      {required this.leadingTextButton,
      required this.trailingTextButton,
      super.key});

  final Widget leadingTextButton;
  final Widget trailingTextButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        leadingTextButton,
        const Icon(Icons.circle, size: 6.0),
        trailingTextButton,
      ],
    );
  }
}
