import 'package:get/get.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/services/services.dart';

class PdfStateController extends GetxController {
  String pathPDF = '';
  String landscapePathPdf = '';
  String remotePDFpath = '';
  String corruptedPathPDF = '';

  final PdfService _pdfService = PdfService();

  @override
  void onInit() {
    // super.initState();
    _pdfService.fromAsset(AppAssets.PROTOCOL_2020, 'corrupted.pdf').then((f) {
      corruptedPathPDF = f.path;
      update();
    });
    _pdfService.fromAsset(AppAssets.PROTOCOL_2020, 'demo.pdf').then((f) {
      pathPDF = f.path;
      update();
    });
    _pdfService.fromAsset(AppAssets.PROTOCOL_2020, 'landscape.pdf').then((f) {
      landscapePathPdf = f.path;
      update();
    });
    _pdfService.createFileOfPdfUrl().then((f) {
      remotePDFpath = f.path;
      update();
    });
    super.onInit();
  }
}
