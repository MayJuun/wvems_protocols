import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/shared/shared.dart';

// Here, user selects the version (year) to display
// This triggers 1) download (+load) a PDF from the cloud, or
// 2) load a locally-saved PDF as the current active version
class VersionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NavIcon(Icons.description),
      title: Text(S.NAV_VERSION),
      subtitle: Text(S.NAV_VERSION_SUBTITLE),
      onTap: () => {},
    );
  }
}
