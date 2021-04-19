import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/shared/shared.dart';

// The action items for the currently displayed version. Share and Print
// both fire a dialog to ask if the user wants to act on just the single
// displayed page, or if they want to act on the whole document.
class ShareItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // todo
    return ListTile(
      leading: const NavIcon(Icons.share),
      title: Text(S.NAV_SHARE),
      onTap: () => _displayShareDialog(context),
    );
  }
}

// pop-op dialog for "Download PDFs"
void _displayShareDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StyledDialog(
        title: S.NAV_SHARE,
        subtitle: S.NAV_SHARE_SUBTITLE,
        children: [
          const Gap(32),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('text'),
              Text('text'),
              Text('text'),
            ],
          ),
          const Gap(32),
        ],
      );
    },
  );
}

class _ShareOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//  Share.share(
// 'This app is great! Download here: https://western.vaems.org/')