import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class HomePdfScreen extends StatelessWidget {
  HomePdfScreen({Key? key, required this.path}) : super(key: key);

  final String path;
  final PdfStateController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.resetPdfUI();
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation != controller.currentOrientation) {
          controller.currentOrientation = orientation;
          controller.resetPdfUI();
        }
        return Obx(
          () => Container(
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
                            defaultPage: controller.currentPage.value,
                            fitPolicy: FitPolicy.BOTH,
                            // if set to true, the link is handled in flutter
                            preventLinkNavigation: false,
                            onRender: (intArg) => controller.onPdfRender,
                            onError: controller.onPdfError,
                            onPageError: (intArg, dynamicArg) =>
                                controller.onPdfPageError,
                            onViewCreated: controller.onPdfViewCreated,
                            onLinkHandler: (stringArg) =>
                                controller.onPdfLinkHandler,
                            onPageChanged: (int1Arg, int2Arg) =>
                                controller.onPdfPageChanged,
                          )
                        : const Center(child: CircularProgressIndicator())
                    : Center(
                        child: Text(controller.errorMessage.value),
                      ),
          ),
        );
      },
    );
  }
}
