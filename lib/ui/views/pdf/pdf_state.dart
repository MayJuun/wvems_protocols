import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

import 'pdf_screen.dart';
import 'pdf_state_controller.dart';

class PdfState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.APP_TITLE),
      ),
      drawer: StyledNavDrawer(),
      body: Center(
        child: GetBuilder<PdfStateController>(
          init: PdfStateController(),
          initState: (_) {},
          builder: (_) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AppLogo(),
                    RaisedButton(
                      child: Text(S.OPEN_PDF),
                      onPressed: () {
                        if (_.pathPDF != null || _.pathPDF.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfScreen(path: _.pathPDF),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
