import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/header/home_search_bar.dart';
import 'package:wvems_protocols/ui/views/home/home_screen_stack.dart';
import 'package:wvems_protocols/ui/views/home/home_state_testing.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfStateController>(
      init: PdfStateController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          // // todo: reimplement
          // appBar: homeAppBar(context),
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
        );
      },
    );
  }
}
