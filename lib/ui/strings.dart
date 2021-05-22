// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  String DEFAULT_LIGHT_MODE_COLOR = 'F0F0F0';
  String DEFAULT_DARK_MODE_COLOR = '9E9E9E';

  String APP_TITLE = 'WVEMS Protocols';
  String APP_RELEASE = 'v210217';
  String APP_COPYRIGHT =
      'These protocols are published under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License. You are free to: share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material for any purpose, even commercially) under the following terms: attribution (you must give appropriate credit, provide a link to the license, and indicate if changes were made - you may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use) and sharealike (if you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original with no additional restrictions). You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits. Visit creativecommons.org/licenses/by-sa/4.0 for details.';

  // Nav Drawer
  String NAV_NEW_MESSAGES = 'New Messages';
  String NAV_MESSAGES = 'Messages';
  String NAV_NOTIFICATIONS = 'Notifications from WVEMS';
  String NAV_VERSION = 'Protocol Version';
  String NAV_VERSION_SUBTITLE = 'Select Active PDF';
  String NAV_SHARE = 'Share';
  String NAV_SHARE_SUBTITLE = 'Select what you want to share';
  String NAV_DOWNLOAD = 'Download PDFs';
  String NAV_DOWNLOAD_SUBTITLE =
      'Select PDFs to save\nto your Documents Folder';
  String NAV_SETTINGS = 'Settings';
  String NAV_DISPLAY_MODE = 'Select display mode';
  String NAV_MODE_LIGHT = 'Light Mode';
  String NAV_MODE_DARK = 'Dark Mode';
  String NAV_MODE_SYSTEM = 'Match System';
  String NAV_ABOUT = 'About';
  String NAV_ABOUT_SUBTITLE = 'About WVEMS Protocols';
  String NAV_ABOUT_RELEASE = 'Application Release:';
  String NAV_OK = 'OK';

  String SEARCH_BAR_HINT = 'Search WVEMS Protocols';

  String WOMP_WOMP = 'Nothing Here!\nWomp Womp';
}

_Strings get S => _Strings.instance;
