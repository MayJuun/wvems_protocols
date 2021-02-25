import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/views/home/home_screen_body.dart';
import 'package:wvems_protocols/ui/views/home/home_screen_expandable_body.dart';

class HomeScreenStack extends StatelessWidget {
  // spec: https://github.com/bnxm/material_floating_search_bar/blob/master/example/lib/main.dart

  final actions = [
    FloatingSearchBarAction(
      showIfOpened: false,
      child: CircularButton(
        icon: const Icon(Icons.place),
        onPressed: () {},
      ),
    ),
    FloatingSearchBarAction.searchToClear(
      showIfClosed: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      automaticallyImplyBackButton: false,
      controller: searchController.floatingSearchBarController,
      clearQueryOnClose: true,
      // todo: update/extract
      hint: 'hint goes here',
      iconColor: Colors.grey,
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOutCubic,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      maxWidth: isPortrait ? 600 : 500,
      actions: actions,
      // todo: reimplement
      // progress: model.isLoading,
      debounceDelay: const Duration(milliseconds: 500),
      // todo: reimplement
      // onQueryChanged: model.onQueryChanged,
      scrollPadding: EdgeInsets.zero,
      transition: CircularFloatingSearchBarTransition(),
      builder: (context, _) => HomeScreenExpandableBody(),
      body: HomeScreenBody(),
    );
  }
}
