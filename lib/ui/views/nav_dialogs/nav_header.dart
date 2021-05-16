import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class NavHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    // being displayed. The color should be linked to the year, just like
    // the color of the main ToC button is linked to the color of the year.
    // _newMessages should also be set and passed in from the controller.
    // And _displayWompWomp() is just a placeholder so the menus work.
    // <kludge>
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Obx(
        () => StyledRibbonStack(
          title: VersionsUtil().wvemsText(controller.activeYear.value),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          hasOkButton: false,
          children: <Widget>[
            const Gap(48),
            DrawerAppLogo(),
            const Gap(48),
          ],
        ),
      ),
    );
  }
}
