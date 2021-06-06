// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  String DEFAULT_PRIMARY_COLOR = 'F0F0F0';

  String APP_TITLE = 'WVEMS Protocols';
  String APP_RELEASE = 'v210217';
  String APP_COPYRIGHT =
      'These protocols are published under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License. You are free to: share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material for any purpose, even commercially) under the following terms: attribution (you must give appropriate credit, provide a link to the license, and indicate if changes were made - you may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use) and sharealike (if you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original with no additional restrictions). You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits. Visit creativecommons.org/licenses/by-sa/4.0 for details.';

  // Nav Drawer
  String NAV_NEW_MESSAGES = 'New Messages';
  String NAV_MESSAGES = 'Messages';
  String NAV_NOTIFICATIONS = 'Notifications from WVEMS';
  String NAV_VERSION = 'Protocol Version';
  String NAV_VERSION_SUBTITLE = 'Select protocol version';

  String NAV_SHARE = 'Share';
  String NAV_SHARE_SUBTITLE = 'Select what to share';
  String NAV_SHARE_SCREEN = 'Screen';
  String NAV_SHARE_PDF = 'PDF';
  String NAV_SHARE_LINK = 'App (link)';
  String NAV_SHARE_LINK_INFO =
      'Download the WVEMS Protocols App, available here: https://onelink.to/xu9aq8';
  String NAV_SHARE_QR_CODE = 'Share app (QR code)';

  String NAV_SETTINGS = 'Settings';
  String NAV_DISPLAY_MODE = 'Select display mode';
  String NAV_MODE_LIGHT = 'Light Mode';
  String NAV_MODE_DARK = 'Dark Mode';
  String NAV_MODE_SYSTEM = 'Match System';

  String NAV_ABOUT = 'About';
  String NAV_ABOUT_SUBTITLE = 'About WVEMS Protocols';
  String NAV_ABOUT_RELEASE = 'Application Release:';
  String NAV_ABOUT_MAYJUUN = 'About MayJuun';
  String NAV_ABOUT_MAYJUUN_INFO =
      'Created in collaboration with MayJuun. App\'s code is open source under the MIT license. https://mayjuun.com';

  String NAV_OK = 'OK';

  String SEARCH_BAR_HINT = 'Search Protocols';

  String WOMP_WOMP = 'Nothing Here!\nWomp Womp';
}

_Strings get S => _Strings.instance;
