import 'package:flutter/material.dart';
import 'package:quick_reference/ui/strings.dart';
import 'package:quick_reference/ui/views/nav_dialogs/dialogs.dart';

class HomeBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _Button(
              label: S.NAV_SHARE,
              icon: Icons.share,
              onPressed: () => displayShareDialog(context),
            ),
            _Button(
              label: S.NAV_SETTINGS,
              icon: Icons.settings_applications_sharp,
              onPressed: () => displaySettingsDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 30.0),
      ),
    );
  }
}
