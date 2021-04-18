import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_drawer/shared/shared.dart';

class AboutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NavIcon(Icons.info),
      title: Text(S.NAV_ABOUT),
      subtitle: Text('Release ${S.APP_RELEASE}'),
      onTap: () => _displayAboutDialog(context),
    );
  }
}

// pop-op dialog for "About"
void _displayAboutDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StyledDialog(
        title: const Text('About WVEMS Protocols'),
        children: <Widget>[
          Text('\nApplication Release: ${S.APP_RELEASE}\n'),
          Text(
            S.APP_COPYRIGHT,
            textAlign: TextAlign.justify,
          ),
        ],
      );
    },
  );
}
