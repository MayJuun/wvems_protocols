import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/nav_header.dart';

import 'items/items.dart';
import 'shared/nav_divider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // top level design of the drawer
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // Header, showing logo and styled by active PDF
              NavHeader(),

              // New and current messages, 'Version' selects a PDF
              // PDF may be local or downloaded from the cloud
              NavDivider(),
              NewMessagesItem(),
              VersionItem(),

              // Action items for the currently displayed version
              NavDivider(),
              ShareItem(),
              DownloadItem(),

              // Miscellaneous system options
              NavDivider(),
              SettingsItem(),
              AboutItem(),
            ],
          ),
        ),
      ),
    );
  }
}
