import 'dart:math';

import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/ui/views/home/to_remove/place.dart';
import 'package:wvems_protocols/ui/views/home/to_remove/search_model.dart';

class SearchController extends GetxController {
  // spec: https://pub.dev/packages/material_floating_search_bar
  final FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  final SearchModel model = SearchModel();

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = min(value, 2);
    _index == 2
        ? floatingSearchBarController.hide()
        : floatingSearchBarController.show();
    update();
  }

  @override
  void onClose() {
    floatingSearchBarController.dispose();
    super.onClose();
  }
}
