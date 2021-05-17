import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

// Here, user selects the version (year) to display
// This triggers 1) download (+load) a PDF from the cloud, or
// 2) load a locally-saved PDF as the current active version

// pop-op dialog for "Download PDFs"
void displayVersionDialog(BuildContext context) {
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
      hasOkButton: false,
      children: [
        const Gap(12),
        InkWell(
          highlightColor: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: const [
                Text('text'),
                Text('text'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
