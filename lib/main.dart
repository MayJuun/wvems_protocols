import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/screens/pdf_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PdfState(),
    );
  }
}
