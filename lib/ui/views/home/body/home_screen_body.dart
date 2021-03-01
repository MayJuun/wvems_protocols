import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

import 'body.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PdfStateController>(
      builder: (controller) {
        return controller.pdfState.value.when(
          data: (File file) => HomePdfScreen(path: controller.pathPDF),
          error: (Object error, StackTrace stackTrace) =>
              HomeError(error: error.toString()),
          loading: () => HomeLoading(),
        );
      },
    );
  }
}
