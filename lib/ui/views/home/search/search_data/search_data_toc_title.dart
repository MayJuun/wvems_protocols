import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class SearchDataTocTitle extends StatelessWidget {
  const SearchDataTocTitle({Key? key, required this.pageNumber})
      : super(key: key);

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    final PdfStateController pdfStateController = Get.find();

    return Obx(() => Text(
        pdfStateController.getTableOfContentsFromPageNum(pageNumber),
        style: const TextStyle(fontStyle: FontStyle.italic)
            .apply(color: Colors.grey)));
  }
}
