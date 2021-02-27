import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/set_page_command.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class HomeFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    const Icon _buttonIcon = Icon(Icons.arrow_upward_rounded, size: 36.0);
    final Widget _activeButton = FloatingActionButton(
        elevation: 4.0,
        child: _buttonIcon,
        onPressed: () async => await SetPageCommand().execute());
    const Widget _inactiveButton = FloatingActionButton(
        elevation: 4.0, child: _buttonIcon, onPressed: null);

    return FutureBuilder<PDFViewController>(
      future: controller.asyncController.future,
      builder:
          (BuildContext context, AsyncSnapshot<PDFViewController> snapshot) {
        if (snapshot.hasData) {
          return Obx(
            () => (controller.rxPdfController.value != null)
                ? _activeButton
                : _inactiveButton,
          );
        }
        return _inactiveButton;
      },
    );
  }
}
