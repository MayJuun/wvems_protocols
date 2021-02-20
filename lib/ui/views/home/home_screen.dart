import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/home_complete/pdf_screen.dart';
import 'package:wvems_protocols/ui/views/home/home_error.dart';
import 'package:wvems_protocols/ui/views/home/home_loading.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: reimplement
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(S.APP_TITLE),
      // ),
      body: GetBuilder<PdfStateController>(
        init: PdfStateController(),
        initState: (_) {},
        builder: (_) {
          return Builder(
            builder: (BuildContext context) {
              return _.pdfState.value.when(
                data: (File file) => PdfScreen(path: _.pathPDF),
                error: (Object error, StackTrace stackTrace) =>
                    HomeError(error: error.toString()),
                loading: () => HomeLoading(),
              );
            },
          );
        },
      ),
    );
  }
}
