import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';

class HomeStateTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          child: const Text('Data'),
          onPressed: () =>
              controller.pdfState.value = Pdf.data(controller.file),
        ),
        RaisedButton(
          child: const Text('Loading'),
          onPressed: () => controller.pdfState.value = const Pdf.loading(),
        ),
        RaisedButton(
          child: const Text('Error'),
          onPressed: () => controller.pdfState.value =
              Pdf.error('This is a sample error!', StackTrace.current),
        ),
      ],
    );
  }
}
