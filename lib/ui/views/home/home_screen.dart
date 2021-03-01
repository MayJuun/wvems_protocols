import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/fab/home_fab.dart';
import 'package:wvems_protocols/ui/views/home/header/home_screen_stack.dart';
import 'package:wvems_protocols/ui/views/home/home_state_testing.dart';
import 'package:wvems_protocols/ui/views/home/search/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfStateController>(
      init: PdfStateController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: StyledNavDrawer(),
          body: GetBuilder<SearchController>(
            init: SearchController(),
            initState: (_) {},
            builder: (_) {
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: IndexedStack(
                        index: min(_.index, 2),
                        children: <Widget>[
                          HomeScreenStack(),
                          HomeSearchBar(),
                        ],
                      ),
                    ),
                    HomeStateTesting(),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: HomeFab(),
        );
      },
    );
  }
}
