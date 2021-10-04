import 'package:flutter/material.dart';

class NavDivider extends StatelessWidget {
  const NavDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: Theme.of(context).colorScheme.secondary, thickness: 1);
  }
}
