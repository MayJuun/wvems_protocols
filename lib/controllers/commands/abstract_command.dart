import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

abstract class AbstractCommand {
  final StorageController storageController = Get.find();
  final PdfStateController pdfStateController = Get.find();
  final ProtocolBundleController protocolBundleController = Get.find();
  final PdfSearchController pdfSearchController = Get.find();

  Future<void> execute();
}
