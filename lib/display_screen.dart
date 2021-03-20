import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/file_controller.dart';
import 'package:wvems_protocols/controllers/search_bar.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fileController = Get.put(FileController());
    final Completer<PDFViewController> _controller =
        Completer<PDFViewController>();
    final StreamController<String> _page = StreamController<String>();

    return Scaffold(
      // appBar: AppBar(actions: [SearchBar()]),
      body: Obx(
        () => PDFView(
          filePath: fileController.path,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: false,
          pageFling: false,
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
          onPageChanged: (int page, int total) {
            print('page change: $page/$total');
          },
          onViewCreated: (PDFViewController pdfViewController) async {
            _controller.complete(pdfViewController);
            final int currentPage = await pdfViewController.getCurrentPage();
            final int pageCount = await pdfViewController.getPageCount();
            _page.add('${currentPage + 1} - $pageCount');
          },
        ),
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: '2019',
                  child: const Text('2019'),
                  onPressed: () {
                    fileController.path = 'assets/pdf/wvems-protocols-2019.pdf';
                    Get.offAll(() => DisplayScreen());
                  },
                ),
                FloatingActionButton(
                  heroTag: '2020',
                  child: const Text('2020'),
                  onPressed: () {
                    fileController.path = 'assets/pdf/wvems-protocols-2020.pdf';
                    Get.offAll(() => DisplayScreen());
                  },
                ),
                FloatingActionButton(
                  heroTag: 'home',
                  child: const Icon(Icons.home),
                  onPressed: () async {
                    final PDFViewController pdfController = snapshot.data;
                    await pdfController.setPage(0);
                  },
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
