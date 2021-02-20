import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class HomePdfScreen extends StatelessWidget {
  const HomePdfScreen({Key key, this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();

    return Stack(
      children: <Widget>[
        PDFView(
          filePath: path,
          // required for Android
          key: controller.pdfViewerKey,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: true,
          pageFling: true,
          pageSnap: true,
          defaultPage: controller.currentPage,
          fitPolicy: FitPolicy.BOTH,
          // if set to true, the link is handled in flutter
          preventLinkNavigation: false,
          onRender: controller.onPdfRender,
          onError: controller.onPdfError,
          onPageError: controller.onPdfPageError,
          onViewCreated: controller.onPdfViewCreated,
          onLinkHandler: controller.onPdfLinkHandler,
          onPageChanged: controller.onPdfPageChanged,
        ),
        // controller.errorMessage.isEmpty
        //     ? !controller.isReady
        //         ? const Center(
        //             child: CircularProgressIndicator(),
        //           )
        //         : Container()
        //     : Center(
        //         child: Text(controller.errorMessage),
        //       ),
      ],
    );
  }
}
