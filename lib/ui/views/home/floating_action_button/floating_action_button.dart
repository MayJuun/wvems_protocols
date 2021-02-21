import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/set_page_command.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

Widget homeFloatingActionButton(BuildContext context) {
  final PdfStateController controller = Get.find();
  return FutureBuilder<PDFViewController>(
    future: controller.asyncController.future,
    builder: (BuildContext context, AsyncSnapshot<PDFViewController> snapshot) {
      return Obx(
        () => FloatingActionButton(
          elevation: 4.0,
          child: const Icon(Icons.format_list_numbered_rounded, size: 36.0),
          onPressed:
              snapshot.hasData && controller.rxPdfController.value != null
                  ? SetPageCommand().execute
                  : () {},
        ),
      );
    },
  );
}
