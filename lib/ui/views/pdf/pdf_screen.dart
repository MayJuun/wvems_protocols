import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';

import 'pdf_screen_controller.dart';

class PdfScreen extends StatelessWidget with WidgetsBindingObserver {
  const PdfScreen({Key key, this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfScreenController>(
      init: PdfScreenController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(S.HOME_VIEW),
            actions: <Widget>[
              FutureBuilder<PDFViewController>(
                future: _.controller.future,
                builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
                  if (snapshot.hasData) {
                    return IconButton(
                      icon: const Icon(Icons.list),
                      onPressed: () async {
                        await snapshot.data.setPage(0);
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
          body: Stack(
            children: <Widget>[
              PDFView(
                filePath: path,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: true,
                pageFling: true,
                pageSnap: true,
                defaultPage: _.currentPage,
                fitPolicy: FitPolicy.BOTH,
                preventLinkNavigation:
                    false, // if set to true the link is handled in flutter
                onRender: (_pages) {
                  _.pages = _pages;
                  _.isReady = true;
                  _.update();
                },
                onError: (error) {
                  _.errorMessage = error.toString();
                  _.update();
                  print(error.toString());
                },
                onPageError: (page, error) {
                  _.errorMessage = '$page: ${error.toString()}';
                  _.update();
                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  _.controller.complete(pdfViewController);
                },
                onLinkHandler: (String uri) {
                  print('goto uri: $uri');
                },
                onPageChanged: (int page, int total) {
                  print('page change: $page/$total');
                  _.currentPage = page;
                  _.update();
                },
              ),
              _.errorMessage.isEmpty
                  ? !_.isReady
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container()
                  : Center(
                      child: Text(_.errorMessage),
                    )
            ],
          ),
          floatingActionButton: FutureBuilder<PDFViewController>(
            future: _.controller.future,
            builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
              if (snapshot.hasData) {
                return FloatingActionButton.extended(
                  label: Text('Go to ${_.pages ~/ 2}'),
                  onPressed: () async {
                    await snapshot.data.setPage(_.pages ~/ 2);
                  },
                );
              }

              return Container();
            },
          ),
        );
      },
    );
  }
}
