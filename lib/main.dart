import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Completer<PDFViewController> _controller =
        Completer<PDFViewController>();
    return Scaffold(
      body: PDF(
          enableSwipe: true,
          onViewCreated: (PDFViewController pdfViewController) {
            _controller.complete(pdfViewController);
          }).fromAsset('assets/pdf/wvems_protocols_2020.pdf'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () async => (await _controller.future).setPage(0),
      ),
    );
  }
}
