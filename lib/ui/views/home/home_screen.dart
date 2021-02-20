import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/header/home_app_bar.dart';

import 'body/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfStateController>(
      init: PdfStateController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          // todo: reimplement
          appBar: homeAppBar(context),
          drawer: StyledNavDrawer(),
          body: Builder(
            builder: (BuildContext context) {
              return _.pdfState.value.when(
                data: (File file) => HomePdfScreen(path: _.pathPDF),
                error: (Object error, StackTrace stackTrace) =>
                    HomeError(error: error.toString()),
                loading: () => HomeLoading(),
              );
            },
          ),
        );
      },
    );
  }
}
