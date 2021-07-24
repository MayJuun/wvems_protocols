import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';
import 'package:wvems_protocols/ui/views/home/body/home_pdf_controller.dart';

class ShareScreenCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    // pdfStateController.pdfController?.dat
    final HomePdfController homePdfController = Get.find();
    homePdfController.screenshotController
        .capture()
        .then((Uint8List? image) async {
      // temporary dialog to see what happens with screenshot calls
      Get.dialog(
        Center(
          child: image != null
              ? Image.memory(
                  image,
                  width: 200,
                )
              : Container(
                  height: 400,
                  width: 200,
                  color: Colors.green,
                  child: const Text('no image')),
        ),
      );

      // todo: reimplement
      // if (image != null) {
      //   final imageFile = File.fromRawPath(image);
      //   await Share.shareFiles(
      //     [imageFile.path],
      //     subject: 'Subject',
      //     text: 'Text',
      //   );
      // }
    }).catchError((onError) {
      print(onError);
    });

    print('share screen');
  }
}
