import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/strings.dart';

// Action items for the currently displayed version.
// Download assumes they want the whole document.
class DownloadItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.file_download, size: 30.0),
      title: Text(S.NAV_DOWNLOAD),
      // TODO(brianekey): change this to something real
      onTap: () => {},
    );
  }
}
