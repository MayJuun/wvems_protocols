import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class NavHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // being displayed. The color should be linked to the year, just like
    // the color of the main ToC button is linked to the color of the year.
    // _newMessages should also be set and passed in from the controller.
    // And _displayWompWomp() is just a placeholder so the menus work.
    // <kludge>
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerAppLogo(),
          const SizedBox(height: 8.0),
          StyledProtocolsYear(),
        ],
      ),
    );
  }
}
