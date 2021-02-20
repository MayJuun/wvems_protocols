import 'package:get/get.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/services/services.dart';

class PdfStateController extends GetxController {
  String pathPDF = '';

  final PdfService _pdfService = PdfService();

  final Rx<Pdf> pdfState = const Pdf.loading().obs;

  @override
  void onInit() {
    print('loading pdfs...');
    _pdfService.fromAsset(AppAssets.PROTOCOL_2020, 'active.pdf').then((f) {
      pathPDF = f.path;
      pdfState.value = Pdf.data(f);
      print('pdf loaded: ${f.path}');
      update();
    });
    super.onInit();
  }
}
