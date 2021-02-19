// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  String APP_TITLE = 'WVEMS Protocols';
  String APP_RELEASE = 'v210217';
  String APP_COPYRIGHT =
      'These protocols are published under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License. You are free to: share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material for any purpose, even commercially) under the following terms: attribution (you must give appropriate credit, provide a link to the license, and indicate if changes were made - you may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use) and sharealike (if you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original with no additional restrictions). You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits. Visit creativecommons.org/licenses/by-sa/4.0 for details.';

  // Nav Drawer
  String NAV_NEW_MESSAGES = 'New Messages';
  String NAV_MESSAGES = 'Messages';
  String NAV_NOTIFICATIONS = 'Notifications from WVEMS';
  String NAV_VERSION = 'Version';
  String NAV_MANAGE_DISPLAY_YEAR = 'Manage display year';
  String NAV_SHARE = 'Share';
  String NAV_PRINT = 'Print';
  String NAV_DOWNLOAD = 'Download';
  String NAV_SETTINGS = 'Settings';
  String NAV_DISPLAY_MODE = 'Display Mode';
  String NAV_ABOUT = 'About';
  String NAV_MODE_SELECT = 'Select Display Mode';
  String NAV_MODE_LIGHT = 'Light Mode';
  String NAV_MODE_DARK = 'Dark Mode';
  String NAV_MODE_SYSTEM = 'Match System';
  String NAV_OK = 'OK';

  String WOMP_WOMP = 'Nothing Here!\nWomp Womp';

  //todo: remove
  String HOME_VIEW = 'HomeView';
  String OPEN_PDF = 'Open PDF';
}

_Strings get S => _Strings.instance;
