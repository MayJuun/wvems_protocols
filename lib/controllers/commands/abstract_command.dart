import 'package:get/get.dart';
import 'package:quick_reference/controllers/controllers.dart';

abstract class AbstractCommand {
  final StorageController storageController = Get.find();
  final PdfStateController pdfStateController = Get.find();
  final ProtocolBundleController protocolBundleController = Get.find();
  final SearchController searchController = Get.find();

  Future<void> execute();
}
