import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'pdf_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String path2019 = '';
  String path2020 = '';

  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdf/wvems-protocols-2020.pdf', 'protocol-2020.pdf')
        .then((f) {
      setState(() => path2020 = f.path);
    });
    fromAsset('assets/pdf/wvems-protocols-2019.pdf', 'protocol-2019.pdf')
        .then((f) {
      setState(() => path2019 = f.path);
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    final Completer<File> completer = Completer();
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      final data = await rootBundle.load(asset);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(actions: const [Text('This is an Appbar')]),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
              child: const Text('This is some text'),
            );
          },
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
                      if (path2020.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFScreen(
                              key: UniqueKey(),
                              paths: [path2020, path2019],
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
                      if (path2019.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFScreen(
                                key: UniqueKey(),
                                paths: [path2020, path2019],
                                currentPath: 1),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
