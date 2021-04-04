import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/home/fab/home_fab.dart';
import 'package:wvems_protocols/ui/views/home/header/home_screen_header.dart';
import 'package:wvems_protocols/ui/views/home/home_state_testing.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: StyledNavDrawer(),
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
  }
}
