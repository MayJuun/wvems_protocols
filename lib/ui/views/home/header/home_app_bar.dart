import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';

AppBar homeAppBar(BuildContext context) {
  final PdfStateController controller = Get.find();

  return AppBar(
    centerTitle: true,
    title: Text(S.HOME_VIEW),
    actions: <Widget>[Obx(() => controller.homeAppBarWidget)],
  );
}
