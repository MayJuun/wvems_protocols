import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/views/home/fab/home_fab.dart';
import 'package:wvems_protocols/ui/views/home/header/home_screen_header.dart';

import 'body/home_screen_body.dart';
import 'bottom_nav/home_bottom_nav.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          // drawer: NavDrawer(),
          key: _.homeScaffoldKey,
          body: SafeArea(
            child: HomeScreenHeader(
              body: HomeScreenBody(),
            ),
          ),
          bottomNavigationBar: HomeBottomNav(),
          floatingActionButton: HomeFab(),
//Ekey 5/18 - changed the position of the FaB a bit
            floatingActionButtonLocation: _CustomFloatingActionButtonLocation(FloatingActionButtonLocation.endDocked, 12.0, 12.0),
        );
      },
    );
  }
}

// spec: https://www.programmersought.com/article/66765263481/
class _CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  _CustomFloatingActionButtonLocation(
      this.location, this.offsetX, this.offsetY);

  FloatingActionButtonLocation location;
  double offsetX; // Offset in X direction
  double offsetY; // Offset in Y direction

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}
