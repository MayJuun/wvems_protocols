import 'package:flutter/material.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';

class HomeFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Align(
        alignment: const AlignmentDirectional(0.7, 1),
        child: FloatingActionButton(
            elevation: 4.0,
            child: const Icon(Icons.home_outlined, size: 36.0),
            onPressed: () async => await SetPageCommand().execute()),
      );
}
