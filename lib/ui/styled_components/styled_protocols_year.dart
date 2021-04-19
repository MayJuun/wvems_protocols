import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class StyledProtocolsYear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    return Obx(
      () => Card(
        elevation: 4.0,
        child: Container(
          //padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,2.0),
          height: 56.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: VersionsUtil().wvemsColor(controller.activeYear.value),
              border: Border.all(width: 3.0, color: Colors.grey)),
          child: Text(
            VersionsUtil().wvemsText(controller.activeYear.value),
            textAlign: TextAlign.center,
            style: GoogleFonts.barlow(
              color: Colors.black,
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
