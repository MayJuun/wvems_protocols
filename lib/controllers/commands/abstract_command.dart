import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

abstract class AbstractCommand {
  final PdfStateController pdfStateController = Get.find();

  Future<void> execute();
}
