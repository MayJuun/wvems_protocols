import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/messaging_controller.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class StyledNavDrawer extends StatelessWidget {
  // TODO(brianekey): The _yearColor and _yearText should come from
  // a higher level state somewhere that defines which year is currently
  // being displayed. The color should be linked to the year, just like
  // the color of the main ToC button is linked to the color of the year.
  // _newMessages should also be set and passed in from the controller.
  // And _displayWompWomp() is just a placeholder so the menus work.
  // <kludge>

  //todo: extract into theme / jcontroller
  final Color _yearColor = wvemsColor(2020);

  final controller = Get.put(MessagingController());

  @override
  Widget build(BuildContext context) {
    // top level design of the drawer
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _logoHeader(),
              ..._mainItems(context),
              _customDivider(),
              ..._subItems(context),
              _customDivider(),
              ..._systemItems(context),
            ],
          ),
        ),
      ),
    );
  } // build()

  // the header section of the drawer
  Widget _logoHeader() {
    //returns a Widget list with the logo in a Drawer Header, and a spaced box
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
  } //_logoHeader()

  // the main menu items: user can check for messages,
  // and select the version (year) to display
  List<Widget> _mainItems(BuildContext context) {
    final unreadMessages = controller.unread;
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
              color:
                  unreadMessages.isNotEmpty ? _yearColor : Colors.transparent,
            ),
          ],
        ),
        title: unreadMessages.isEmpty
            ? Text(
                S.NAV_NEW_MESSAGES,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            : Text(S.NAV_MESSAGES),
        subtitle: Text(S.NAV_NOTIFICATIONS),
        onTap: () => _displayUnreadMessages(context, unreadMessages),
      ),
      ListTile(
        leading: const Icon(Icons.description, size: 30.0),
        title: Text(S.NAV_VERSION),
        subtitle: Text(S.NAV_MANAGE_DISPLAY_YEAR),
        onTap: () => _displayUnreadMessages(context, unreadMessages),
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
  List<Widget> _subItems(BuildContext context) {
    return <Widget>[
      ListTile(
        leading: const Icon(Icons.share, size: 30.0),
        title: Text(S.NAV_SHARE),
        onTap: () => _displayWompWomp(context),
      ),
      ListTile(
        leading: const Icon(Icons.print, size: 30.0),
        title: Text(S.NAV_PRINT),
        onTap: () => _displayWompWomp(context),
      ),
      ListTile(
        leading: const Icon(Icons.file_download, size: 30.0),
        title: Text(S.NAV_DOWNLOAD),
        // TODO(brianekey): change this to something real
        onTap: () => _displayWompWomp(context),
      ),
    ];
  } //_subItems()

  // The miscellaneous system options
  List<Widget> _systemItems(BuildContext context) {
    return <Widget>[
      ListTile(
        leading: const Icon(Icons.settings, size: 30.0),
        title: Text(S.NAV_SETTINGS),
        subtitle: Text(S.NAV_DISPLAY_MODE),
        onTap: () => _displaySettingsDialog(context),
      ),
      ListTile(
        leading: const Icon(Icons.info, size: 30.0),
        title: Text(S.NAV_ABOUT),
        subtitle: Text('Release ${S.APP_RELEASE}'),
        onTap: () => _displayAboutDialog(context),
      ),
    ];
  } //_systemItems()

  // pop-op dialog for "Settings"
  void _displaySettingsDialog(BuildContext context) {
    final ThemeController themeService = Get.find();
    Get.back();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(S.NAV_MODE_SELECT),
          children: <Widget>[
            RadioListTile(
              title: Text(S.NAV_MODE_LIGHT),
              value: ThemeMode.light,
              groupValue: themeService.themeMode,
              onChanged: (value) => themeService.setThemeMode(ThemeMode.light),
            ),
            RadioListTile(
              title: Text(S.NAV_MODE_DARK),
              value: ThemeMode.dark,
              groupValue: themeService.themeMode,
              onChanged: (value) => themeService.setThemeMode(ThemeMode.dark),
            ),
            RadioListTile(
              title: Text(S.NAV_MODE_SYSTEM),
              value: ThemeMode.system,
              groupValue: themeService.themeMode,
              onChanged: (value) => themeService.setThemeMode(ThemeMode.system),
            ),
            TextButton(
              child: Text(S.NAV_OK),
              onPressed: () => Get.back(),
            ),
          ],
        );
      }, // builder
    ); // showDialog()
  } // _displaySettingsDialog

  // pop-op dialog for "About"
  void _displayAboutDialog(BuildContext context) {
    Get.back();
    showDialog(
      context: context,
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
            TextButton(
              child: Text(S.NAV_OK),
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
  void _displayWompWomp(BuildContext context) {
    Get.back();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            S.WOMP_WOMP,
            textAlign: TextAlign.center,
          ),
          children: <Widget>[
            TextButton(
              child: Text(S.NAV_OK),
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

void _displayUnreadMessages(
    BuildContext context, Set<Map<String, dynamic>> messages) {
  Get.back();
  final List<Text> unreadMessages = [];
  for (var message in messages) {
    unreadMessages.add(Text(
      '${message['dateTime']}\n'
      '${message['title']} ${message['body']}',
    ));
  }
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Unread Messages', textAlign: TextAlign.center),
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: unreadMessages,
            ),
          ),
          TextButton(
            child: Text(S.NAV_OK),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
