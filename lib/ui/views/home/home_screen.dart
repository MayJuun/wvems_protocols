import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/fab/home_fab.dart';
import 'package:wvems_protocols/ui/views/home/header/home_screen_header.dart';
import 'package:wvems_protocols/ui/views/home/home_state_testing.dart';

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
          drawer: StyledNavDrawer(),
          key: _.homeScaffoldKey,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(child: HomeScreenHeader()),
                HomeStateTesting(),
              ],
            ),
          ),
          floatingActionButton: HomeFab(),
        );
      },
    );
  }
}
