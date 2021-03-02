import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/ui/views/home/to_remove/search_model.dart';

class SearchController extends GetxController {
  // spec: https://pub.dev/packages/material_floating_search_bar
  final FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  final SearchModel model = SearchModel();

  @override
  void onClose() {
    floatingSearchBarController.dispose();
    super.onClose();
  }
}
