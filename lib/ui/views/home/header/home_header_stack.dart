import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/views/home/body/home_screen_body.dart';
import 'package:wvems_protocols/ui/views/home/search/home_search_expanded.dart';

class HomeHeaderStack extends StatelessWidget {
  // spec: https://github.com/bnxm/material_floating_search_bar/blob/master/example/lib/main.dart

  final actions = [
    /// Actions shown on the right of the search bar
    FloatingSearchBarAction(
      showIfOpened: false,
      child: CircularButton(
        icon: const Icon(Icons.help),
        onPressed: () {
          // todo: add help dialog vs how to use
        },
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
      hint: S.SEARCH_BAR_HINT,
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
      debounceDelay: const Duration(milliseconds: 400),
      // todo: reimplement
      // onQueryChanged: model.onQueryChanged,
      scrollPadding: EdgeInsets.zero,
      transition: CircularFloatingSearchBarTransition(),

      /// When search bar is clicked, this widget is shown
      builder: (context, _) => HomeSearchExpanded(),

      /// This is the default widget shown behind the search bar + expandable body
      body: HomeScreenBody(),
    );
  }
}
