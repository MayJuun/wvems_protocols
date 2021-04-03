import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

abstract class AbstractCommand {
  final PdfStateController pdfStateController = Get.find();
  final SearchController searchController = Get.find();

  Future<void> execute();
}
