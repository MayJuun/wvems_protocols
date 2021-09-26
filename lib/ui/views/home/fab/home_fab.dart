import 'package:flutter/material.dart';
import 'package:quick_reference/controllers/commands/commands.dart';

class HomeFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          elevation: 4.0,
          child: const Icon(Icons.home_outlined, size: 30.0),
          onPressed: () async => await SetPageCommand().execute(),
        ),
      );
}
