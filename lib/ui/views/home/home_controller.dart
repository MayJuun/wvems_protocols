import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

  final isDrawerOpen = false.obs;

  void toggleDrawer() {
    final state = homeScaffoldKey.currentState;
    if (state != null) {
      state.isDrawerOpen ? Get.back() : state.openDrawer();
    }
  }
}
