import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/views/home/search/home_search_expanded.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/dialogs.dart';

class HomeScreenHeader extends StatelessWidget {
  // spec: https://github.com/bnxm/material_floating_search_bar/blob/master/example/lib/main.dart
  // also: https://resocoder.com/2021/01/23/search-bar-in-flutter-logic-material-ui/

  const HomeScreenHeader({Key? key, this.body}) : super(key: key);

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();

    final actions = [
      /// Actions shown on the right of the search bar
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.help),
          onPressed: () => displayAboutDialog(context),
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      automaticallyImplyBackButton: false,
      backgroundColor: context.theme.backgroundColor,
      automaticallyImplyDrawerHamburger: false,
      controller: searchController.floatingSearchBarController,
      clearQueryOnClose: false,
      hint: S.SEARCH_BAR_HINT,
      iconColor: Colors.grey,
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOutCubic,
      physics: const NeverScrollableScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      actions: actions,
      progress: searchController.isLoading.value,
      debounceDelay: const Duration(milliseconds: 450),
      onQueryChanged: (String newValue) async =>
          await searchController.onQueryChanged(newValue),
      transition: CircularFloatingSearchBarTransition(),

      /// When search bar is clicked, this widget is shown
      builder: (context, _) => HomeSearchExpanded(),

      /// This is the default widget shown behind the search bar + expandable body
      body: Column(
        children: [
          // this container is directly below the material floating search bar
          // it is used in place of an AppBar
          Container(
            height: 60,
            color: Theme.of(context).primaryColor,
          ),
          Expanded(child: body ?? Container()),
        ],
      ),
    );
  }
}
