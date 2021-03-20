import 'package:get/get.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:wvems_protocols/controllers/file_controller.dart';

class SearchController extends GetxController {
  final controller = Get.put(FileController());
  Map<int, String> pageStrings = {};

  @override
  Future<void> onInit() async {
    await loadNewFile();
    super.onInit();
  }

  Future<void> loadNewFile() async {
    print(controller.path);
    final PDFDoc doc = await PDFDoc.fromPath(controller.path);
    for (var i = 0; i < doc.length; i++) {
      pageStrings[i] = await doc.pageAt(i).text;
      print(pageStrings[i]);
    }
  }
}
