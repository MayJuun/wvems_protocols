import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/shared/shared.dart';

// The action items for the currently displayed version. Share and Print
// both fire a dialog to ask if the user wants to act on just the single
// displayed page, or if they want to act on the whole document.
class ShareItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NavIcon(Icons.share),
      title: Text(S.NAV_SHARE),
      onTap: () => {},
    );
  }
}
