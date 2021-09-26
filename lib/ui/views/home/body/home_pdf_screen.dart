import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:quick_reference/controllers/controllers.dart';
import 'package:quick_reference/ui/views/home/body/home_pdf_controller.dart';
import 'package:screenshot/screenshot.dart';

class HomePdfScreen extends StatelessWidget {
  const HomePdfScreen({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    final homePdfController = Get.put(HomePdfController());

    controller.resetPdfUI();
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation != controller.currentOrientation) {
          controller.currentOrientation = orientation;
          controller.resetPdfUI(goHome: false);
        }
        return Obx(
          () => Screenshot(
            controller: homePdfController.screenshotController,
            child: Container(
              // todo: remove color (used for screenshot testing)
              // color: Colors.green,
              child:
                  // only display the PDFView screen if the 'isReady' tag is true
                  controller.errorMessage.value.isEmpty
                      ? !controller.isReady.value
                          ? PDFView(
                              filePath: path,
                              // required for Android
                              key: controller.pdfViewerKey,
                              enableSwipe: true,
                              swipeHorizontal: false,
                              autoSpacing: true,
                              pageFling: true,
                              pageSnap: true,
                              fitEachPage: true,
                              defaultPage: controller.currentPage.value,
                              fitPolicy: FitPolicy.BOTH,
                              // if set to true, the link is handled in flutter
                              preventLinkNavigation: false,
                              // onRender: (intArg) => controller.onPdfRender,
                              onError: controller.onPdfError,
                              onPageError: (intArg, dynamicArg) =>
                                  controller.onPdfPageError,
                              onViewCreated: controller.onPdfViewCreated,
                              onLinkHandler: (stringArg) =>
                                  controller.onPdfLinkHandler,
                              // onPageChanged: (int1Arg, int2Arg) =>
                              //     controller.onPdfPageChanged,
                            )
                          : const Center(child: CircularProgressIndicator())
                      : Center(
                          child: Text(controller.errorMessage.value),
                        ),
            ),
          ),
        );
      },
    );
  }
}
