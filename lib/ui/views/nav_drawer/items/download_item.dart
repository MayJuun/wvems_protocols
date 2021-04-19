import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/shared/shared.dart';

// Action items for the currently displayed version.
// Download assumes they want the whole document.
class DownloadItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NavIcon(Icons.file_download),
      title: Text(S.NAV_DOWNLOAD),
      onTap: () => _displayDownloadDialog(context),
    );
  }
}

// pop-op dialog for "Download PDFs"
void _displayDownloadDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StyledDialog(
        title: S.NAV_DOWNLOAD,
        subtitle: S.NAV_DOWNLOAD_SUBTITLE,
        children: [
          const Gap(12),
          // todo: define/update based on controller
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              '2019 WVEMS Protocols',
              style: context.textTheme.bodyText2,
            ),
            onChanged: (bool? value) {},
            value: false,
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              '2020 WVEMS Protocols',
              style: context.textTheme.bodyText2,
            ),
            onChanged: (bool? value) {},
            value: false,
          ),
        ],
      );
    },
  );
}
