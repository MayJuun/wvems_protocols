import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';

AppBar homeAppBar(BuildContext context) {
  final PdfStateController controller = Get.find();

  return AppBar(
    centerTitle: true,
    title: Text(S.HOME_VIEW),
    actions: <Widget>[
      (controller.rxPdfController != null)
          ? Obx(
              () => (controller.rxPdfController.value != null)
                  ? IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () async {
                        await controller.rxPdfController.value.setPage(0);
                      },
                    )
                  : Container(),
            )
          : Container()
    ],
  );
}
