// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  final String DEFAULT_PRIMARY_COLOR = 'F0F0F0';

  final String APP_TITLE = 'WVEMS Protocols';
  final String APP_RELEASE = 'v210217';
  final String APP_COPYRIGHT =
      'These protocols are published under the Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) License. You are free to: share (copy and redistribute the material in any medium or format) and adapt (remix, transform, and build upon the material for any purpose, even commercially) under the following terms: attribution (you must give appropriate credit, provide a link to the license, and indicate if changes were made - you may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use) and sharealike (if you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original with no additional restrictions). You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits. Visit creativecommons.org/licenses/by-sa/4.0 for details.';

  // Nav Drawer
  final String NAV_NEW_MESSAGES = 'New Messages';
  final String NAV_MESSAGES = 'Messages';
  final String NAV_NOTIFICATIONS = 'Notifications from WVEMS';
  final String NAV_VERSION = 'Protocol Version';
  final String NAV_VERSION_SUBTITLE = 'Select protocol version';

  final String NAV_SHARE = 'Share';
  final String NAV_SHARE_SUBTITLE = 'Select what to share';
  final String NAV_SHARE_SCREEN = 'Screen';
  final String NAV_SHARE_PDF = 'PDF';
  final String NAV_SHARE_LINK = 'App (Link)';
  final String NAV_SHARE_LINK_INFO =
      'Download the WVEMS Protocols App, available here: https://onelink.to/xu9aq8';
  final String NAV_SHARE_QR_CODE = 'App (QR Code)';

  final String NAV_SETTINGS = 'Settings';
  final String NAV_DISPLAY_MODE = 'Select display mode';
  final String NAV_MODE_LIGHT = 'Light Mode';
  final String NAV_MODE_DARK = 'Dark Mode';
  final String NAV_MODE_SYSTEM = 'Match System';

  final String NAV_ABOUT = 'About';
  final String NAV_ABOUT_SUBTITLE = 'About WVEMS Protocols';
  final String NAV_ABOUT_RELEASE = 'Application Release:';
  final String NAV_ABOUT_MAYJUUN = 'About MayJuun';
  final String NAV_ABOUT_MAYJUUN_INFO =
      "Created in collaboration with MayJuun. App's code is open source under the MIT license.";
  final String NAV_ABOUT_MAYJUUN_SITE = 'https://mayjuun.com';

  final String NAV_OK = 'OK';

  final String SEARCH_BAR_HINT = 'Search Protocols';

  final String WOMP_WOMP = 'Nothing Here!\nWomp Womp';
}

_Strings get S => _Strings.instance;
