import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/header/home_app_bar.dart';
import 'package:wvems_protocols/ui/views/home/home_state_testing.dart';

import 'body/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PdfStateController>(
      init: PdfStateController(),
      builder: (controller) {
        return Scaffold(
          // todo: reimplement
          appBar: homeAppBar(context),
          drawer: StyledNavDrawer(),
          body: Column(
            children: [
              Expanded(
                child: controller.pdfState.value.when(
                  data: (File file) => HomePdfScreen(path: controller.pathPDF),
                  error: (Object error, StackTrace stackTrace) =>
                      HomeError(error: error.toString()),
                  loading: () => HomeLoading(),
                ),
              ),
              HomeStateTesting(),
            ],
          ),
        );
      },
    );
  }
}
