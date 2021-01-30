import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/ui/app_logo.dart';
import 'package:wvems_protocols/ui/nav_drawer.dart';
import 'package:wvems_protocols/ui/screens/pdf_screen.dart';

class PdfState extends StatefulWidget {
  @override
  _PdfStateState createState() => _PdfStateState();
}

class _PdfStateState extends State<PdfState> {
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset(AppAssets.PROTOCOL_2019, 'corrupted.pdf').then((f) {
      setState(() {
        corruptedPathPDF = f.path;
      });
    });
    fromAsset(AppAssets.PROTOCOL_2019, 'demo.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
    fromAsset(AppAssets.PROTOCOL_2019, 'landscape.pdf').then((f) {
      setState(() {
        landscapePathPdf = f.path;
      });
    });

    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('WVEMS Protocols'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AppLogo(),
                RaisedButton(
                  child: Text("Open PDF"),
                  onPressed: () {
                    if (pathPDF != null || pathPDF.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfScreen(path: pathPDF),
                        ),
                      );
                    }
                  },
                ),
                // RaisedButton(
                //   child: Text("Open Landscape PDF"),
                //   onPressed: () {
                //     if (landscapePathPdf != null ||
                //         landscapePathPdf.isNotEmpty) {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) =>
                //               PdfScreen(path: landscapePathPdf),
                //         ),
                //       );
                //     }
                //   },
                // ),
                // RaisedButton(
                //   child: Text("Remote PDF"),
                //   onPressed: () {
                //     if (remotePDFpath != null || remotePDFpath.isNotEmpty) {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => PdfScreen(path: remotePDFpath),
                //         ),
                //       );
                //     }
                //   },
                // ),
                // RaisedButton(
                //   child: Text("Open Corrupted PDF"),
                //   onPressed: () {
                //     if (pathPDF != null) {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) =>
                //               PdfScreen(path: corruptedPathPDF),
                //         ),
                //       );
                //     }
                //   },
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
