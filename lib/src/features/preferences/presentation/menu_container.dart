import 'package:flutter/material.dart';

enum RoundedMenuEdges { top, bottom, none }

class MenuContainer extends StatelessWidget {
  const MenuContainer(
      {super.key,
      required this.child,
      this.roundedMenuEdges = RoundedMenuEdges.none});

  final Widget child;
  final RoundedMenuEdges roundedMenuEdges;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry? _borderRadius() {
      switch (roundedMenuEdges) {
        case RoundedMenuEdges.top:
          return const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16));
        case RoundedMenuEdges.bottom:
          return const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16));
        case RoundedMenuEdges.none:
          return null;
      }
    }

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: _borderRadius(),
      ),
      child: child,
    );
  }
}
