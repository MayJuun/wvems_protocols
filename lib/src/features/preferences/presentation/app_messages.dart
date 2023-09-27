import 'package:flutter/material.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class AppMessages extends StatelessWidget {
  const AppMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuContainer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Message 1'),
            Text('Message 2'),
            Text('Message 3'),
          ],
        ),
      ),
    );
  }
}