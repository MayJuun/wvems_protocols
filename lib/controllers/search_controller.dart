import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class SearchController extends GetxController {
  final PdfStateController _pdfStateController = Get.find();

  final RxBool isLoading = false.obs;

  // spec: https://pub.dev/packages/material_floating_search_bar
  final FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  Future<bool> onQueryChanged(String newValue) async {
    // todo: reimplement if (query == _query) { return; }
    // this will make it so that the query doesn't show isLoading content

    isLoading.value = true;
    // todo: use OBx, so that update() can be removed?
    update();

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    update();
    return true;
  }

  void clear() {
    // todo: implement
    // _suggestions = history;
  }

  @override
  void onClose() {
    floatingSearchBarController.dispose();
    super.onClose();
  }
}
