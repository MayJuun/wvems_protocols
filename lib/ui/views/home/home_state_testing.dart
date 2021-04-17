import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/controllers/firebase_controller.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/services/services.dart';

class HomeStateTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();

    return GetBuilder<FirebaseController>(
      init: FirebaseController(),
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('2020'),
              onPressed: () => controller.loadNewPdf(AppAssets.PROTOCOL_2020),
            ),
            ElevatedButton(
              child: const Text('2019'),
              onPressed: () => controller.loadNewPdf(AppAssets.PROTOCOL_2019),
            ),
            ElevatedButton(
              child: const Text('examp'),
              // onPressed: () => AuthService().signInAnonymously(),
              onPressed: () => _.getListExample(),
              // controller.pdfFileState.value = const PdfFileState.loading(),
            ),
            // ElevatedButton(
            //   child: const Text('logout'),
            //   onPressed: () => AuthService().signOut(),
            //   // onPressed: () => controller.pdfFileState.value =
            //   //     PdfFileState.error('This is a sample error!', StackTrace.current),
            // ),
          ],
        );
      },
    );
  }
}
