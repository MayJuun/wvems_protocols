import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
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
      onTap: () => _displayVersionDialog(context),
    );
  }
}

// pop-op dialog for "Download PDFs"
void _displayVersionDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) => _VersionDialog(),
  );
}

class _VersionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledDialog(
      title: S.NAV_VERSION,
      subtitle: S.NAV_VERSION_SUBTITLE,
      children: [
        const Gap(12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue,
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('text'),
                  Text('text'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
