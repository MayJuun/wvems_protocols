import 'package:flutter/material.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';

class HomeFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 4.0,
          child: Icon(
            Icons.arrow_upward_rounded,
            size: 36.0,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () async => await SetPageCommand().execute(),
        ),
      );
}
