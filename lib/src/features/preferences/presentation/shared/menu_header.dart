import 'package:flutter/material.dart';

import '../../../../../wvems_protocols.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop()),
        Text(
          label,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge?.apply(fontWeightDelta: 2),
        ),
        gapW32,
      ],
    );
  }
}
