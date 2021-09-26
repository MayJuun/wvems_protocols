import 'package:flutter/material.dart';
import 'package:quick_reference/ui/strings.dart';
import 'package:quick_reference/ui/views/nav_dialogs/dialogs.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.NAV_ABOUT,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        IconButton(
          onPressed: () => displayAboutDialog(context),
          icon: const Icon(Icons.help),
        ),
      ],
    );
  }
}
