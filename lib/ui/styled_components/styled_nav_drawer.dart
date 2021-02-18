import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:wvems_protocols/controllers/theme_service.dart';
import 'package:wvems_protocols/ui/strings.dart';

class StyledNavDrawer extends StatelessWidget {
  // keep a private copy of the context accessible to the entire instance
  BuildContext _context;

  // TODO(brianekey): The _yearColor and _yearText should come from
  // a higher level state somewhere that defines which year is currently
  // being displayed. The color should be linked to the year, just like
  // the color of the main ToC button is linked to the color of the year.
  // _newMessages should also be set and passed in from the controller.
  // And _displayWompWomp() is just a placeholder so the menus work.
  // <kludge>
  final bool _newMessages = true;
  final String _yearText = 'Protocols 2020';
  final Color _yearColor = Colors.purple[100]; // </kludge>

  @override
  Widget build(BuildContext context) {
    // make context available everywhere in this instance
    _context = context;

    // top level design of the drawer
    return Drawer(
      child: ListView(
        children: <Widget>[
          _logoHeader(),
          ..._mainItems(),
          _customDivider(),
          ..._subItems(),
          _customDivider(),
          ..._systemItems(),
        ],
      ),
    );
  } // build()

  // the header section of the drawer
  Widget _logoHeader() {
    //returns a Widget list with the logo in a Drawer Header, and a spaced box
    return DrawerHeader(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
      child: Column(
        //space between implies MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 60.0,
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3.0, color: Colors.grey)),
            child: SvgPicture.asset('assets/svg/wvems_logo_light_simple.svg'),
          ),
          Container(
            height: 60.0,
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _yearColor,
                border: Border.all(width: 3.0, color: Colors.grey)),
            child: Text(
              '$_yearText',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  } //_logoHeader()

  // the main menu items: user can check for messages,
  // and select the version (year) to display
  List<Widget> _mainItems() {
    return <Widget>[
      // This is the only dynamic list item (that's why it's first on the list).
      // If there are _newMessages, then the mail icon will have a colored dot,
      // (otherwise the dot is invisible) and the menu text will change from
      // "Messages" to "New Messages"
      ListTile(
        leading: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            const Icon(Icons.message, size: 30.0),
            Icon(
              Icons.circle,
              size: 12.0,
              color: _newMessages
                  ? _yearColor
                  : const Color.fromRGBO(0, 0, 0, 0.0),
            ),
          ],
        ),
        title: _newMessages
            ? const Text(
                'New Messages',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : const Text('Messages'),
        subtitle: const Text('Notifications from WVEMS'),
        onTap: _displayWompWomp,
      ),
      ListTile(
        leading: const Icon(Icons.description, size: 30.0),
        title: const Text('Version'),
        subtitle: const Text('Manage display year'),
        onTap: _displayWompWomp,
      ),
    ];
  } //_mainItems()

  // the divider between the sections
  Widget _customDivider() {
    return const Divider(
      color: Color.fromRGBO(127, 127, 127, 0.5),
      thickness: 1.0,
      height: 16.0,
      indent: 16.0,
      endIndent: 16.0,
    );
  } //_customDivider()

  // The action items for the currently displayed version. Share and Print
  // both fire a dialog to ask if the user wants to act on just the single
  // displayed page, or if they want to act on the whole document. Download
  // just assumes they want the whole document.
  List<Widget> _subItems() {
    return <Widget>[
      ListTile(
        leading: const Icon(Icons.share, size: 30.0),
        title: const Text('Share'),
        onTap: _displayWompWomp,
      ),
      ListTile(
        leading: const Icon(Icons.print, size: 30.0),
        title: const Text('Print'),
        onTap: _displayWompWomp,
      ),
      ListTile(
        leading: const Icon(Icons.file_download, size: 30.0),
        title: const Text('Download'),
        // TODO(brianekey): change this to something real
        onTap: _displayWompWomp,
      ),
    ];
  } //_subItems()

  // The miscellaneous system options
  List<Widget> _systemItems() {
    return <Widget>[
      ListTile(
        leading: const Icon(Icons.settings, size: 30.0),
        title: const Text('Settings'),
        subtitle: const Text('Display Mode'),
        onTap: _displaySettingsDialog,
      ),
      ListTile(
        leading: const Icon(Icons.info, size: 30.0),
        title: const Text('About'),
        subtitle: Text('Release ${S.APP_RELEASE}'),
        onTap: _displayAboutDialog,
      ),
    ];
  } //_systemItems()

  // pop-op dialog for "Settings"
  void _displaySettingsDialog() {
    final ThemeService themeService = Get.find();
    Get.back();
    showDialog(
      context: _context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Display Mode'),
          children: <Widget>[
            ListTile(
              title: const Text('Light Mode'),
              leading: Radio(
                value: ThemeMode.light,
                groupValue: themeService.themeMode,
                onChanged: (value) {
                  themeService.setThemeMode(ThemeMode.light);
                },
              ),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              leading: Radio(
                value: ThemeMode.dark,
                groupValue: themeService.themeMode,
                onChanged: (value) {
                  themeService.setThemeMode(ThemeMode.dark);
                },
              ),
            ),
            ListTile(
              title: const Text('Match System'),
              leading: Radio(
                value: ThemeMode.system,
                groupValue: themeService.themeMode,
                onChanged: (value) {
                  themeService.setThemeMode(ThemeMode.system);
                },
              ),
            ),
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              }, //onPressed
            ),
          ],
        );
      }, // builder
    ); // showDialog()
  } // _displaySettingsDialog

  // pop-op dialog for "About"
  void _displayAboutDialog() {
    Get.back();
    showDialog(
      context: _context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('About WVEMS Protocols'),
          contentPadding: const EdgeInsets.all(12.0),
          children: <Widget>[
            Text('\nApplication Release: ${S.APP_RELEASE}\n'),
            Text(
              S.APP_COPYRIGHT,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 12.0),
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              }, //onPressed
            ),
          ],
        );
      }, // builder
    ); //showDialog()
  } //_displayAboutDialog()

  // More <kludge>
  void _displayWompWomp() {
    Get.back();
    showDialog(
      context: _context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Nothing Here!\nWomp Womp'),
          children: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              }, //onPressed
            ),
          ],
        );
      }, // builder
    ); // showDialog()
  } // </kludge>

} //StyledNavDrawer
