import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  const NavIcon(this.icon, {Key? key}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 30.0);
  }
}
