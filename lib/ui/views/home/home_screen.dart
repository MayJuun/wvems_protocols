import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/fab/home_fab.dart';
import 'package:wvems_protocols/ui/views/home/header/home_header_stack.dart';
import 'package:wvems_protocols/ui/views/home/home_state_testing.dart';

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
                      child: HomeHeaderStack(),
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
