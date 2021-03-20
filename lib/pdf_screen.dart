import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pdf_text/pdf_text.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({
    Key? key,
    this.paths = const <String>[],
    this.currentPath = 0,
  }) : super(key: key);

  final List<String> paths;
  final int currentPath;

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PDFView(
            key: widget.key,
            filePath: widget.paths[widget.currentPath],
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? const Center(child: CircularProgressIndicator())
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: '2020',
                icon: TextButton(
                  child: const Text('2020'),
                  onPressed: () {
                    if (widget.paths[0].isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(
                            key: UniqueKey(),
                            paths: widget.paths,
                            currentPath: 0,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              BottomNavigationBarItem(
                label: '2019',
                icon: TextButton(
                  child: const Text('2019'),
                  onPressed: () {
                    if (widget.paths[0].isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(
                            key: UniqueKey(),
                            paths: widget.paths,
                            currentPath: 1,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              BottomNavigationBarItem(
                label: 'Home',
                icon: FutureBuilder<PDFViewController>(
                  future: _controller.future,
                  builder:
                      (context, AsyncSnapshot<PDFViewController> snapshot) {
                    if (snapshot.hasData) {
                      return FloatingActionButton.extended(
                        label: const Icon(Icons.home),
                        onPressed: () async {
                          snapshot.data!.setPage(0);
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
