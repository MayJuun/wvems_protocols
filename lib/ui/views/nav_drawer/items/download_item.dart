import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/shared/shared.dart';

// Action items for the currently displayed version.
// Download assumes they want the whole document.
class DownloadItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NavIcon(Icons.file_download),
      title: Text(S.NAV_DOWNLOAD),
      onTap: () => {},
    );
  }
}
