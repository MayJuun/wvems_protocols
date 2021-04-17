import 'package:flutter/material.dart';

class NavDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      // todo: extract into theme
      color: Color.fromRGBO(127, 127, 127, 0.5),
      thickness: 1.0,
      height: 16.0,
      indent: 16.0,
      endIndent: 16.0,
    );
  }
}
