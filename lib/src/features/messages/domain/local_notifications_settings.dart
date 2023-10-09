import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const _assetIconAndroid = 'notification_icon';
const _assetIconLinux = 'assets/icons/wvems-protocols-ios.png';

typedef ActionId = String;

/// These actions are cool in theory, but they depend on iOS 10+, macOS 10.14+,
/// and Android with a `showsUserInterface` property set to true in the
/// AndroidNotificationAction class
///
/// As it stands, this is far too much setup for me to implement easily
///
/// https://pub.dev/packages/flutter_local_notifications#notification-actions
///
enum NotificationActions {
  /// Currently the only DarwinNotificationAction.text setting
  /// Collect text input and bring it into the app
  collectTextInput(
    actionId: 'COLLECT_TEXT',
    title: 'Text Action 1',
    options: {},
    isTextCategory: true,
    buttonTitle: 'Send',
    placeholder: 'Placeholder',
  ),

  /// A notification action which triggers a App navigation event
  navigateAction(
    actionId: 'NAVIGATE',
    title: 'Action 1 (navigate)',
    options: {DarwinNotificationActionOption.foreground},
  ),

  /// A notification action which triggers a url launch event
  launchUrlAction(
    actionId: 'LAUNCH_URL',
    title: 'Action 2 (launch url)',
    options: {DarwinNotificationActionOption.foreground},
  ),

  /// A notification action which triggers a destructive action
  destructiveAction(
    actionId: 'DESTRUCTIVE',
    title: 'Action 3 (destructive)',
    options: {DarwinNotificationActionOption.destructive},
  ),

  /// A notification action which can only be shown if the user
  /// has unlocked their device
  openIfAuthenticated(
    actionId: 'OPEN_IF_AUTHENTICATED',
    title: 'Action 4 (auth required)',
    options: {DarwinNotificationActionOption.authenticationRequired},
  );

  const NotificationActions({
    required this.actionId,
    required this.title,
    required this.options,
    this.isTextCategory = false,
    this.buttonTitle,
    this.placeholder,
  });

  /// Used for all DarwinNotificationActions
  final ActionId actionId;
  final String title;
  final Set<DarwinNotificationActionOption> options;

  /// Only used for DarwinNotificationAction.text
  final bool isTextCategory;
  final String? buttonTitle;
  final String? placeholder;
}

final localNotificationsSettings = InitializationSettings(
  android: _initializationSettingsAndroid,
  iOS: _initializationSettingsDarwin,
  macOS: _initializationSettingsDarwin,
  linux: _initializationSettingsLinux,
);

/// Defines a iOS/MacOS notification category for text input actions.
const String _textCategory = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String _plainCategory = 'plainCategory';

final _notificationCategories = <DarwinNotificationCategory>[
  DarwinNotificationCategory(
    _textCategory,
    actions: _textActions,
  ),
  DarwinNotificationCategory(
    _plainCategory,
    actions: _plainActions,
    options: <DarwinNotificationCategoryOption>{
      DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
    },
  ),
];

final _initializationSettingsDarwin = DarwinInitializationSettings(
  requestAlertPermission: false,
  requestBadgePermission: false,
  requestSoundPermission: false,
  notificationCategories: _notificationCategories,

  /// Since this is only relevant for iOS < 10, I'm not setting this value
  // onDidReceiveLocalNotification:
);
const _initializationSettingsAndroid =
    AndroidInitializationSettings(_assetIconAndroid);

final _initializationSettingsLinux = LinuxInitializationSettings(
  defaultActionName: 'Open notification',
  defaultIcon: AssetsLinuxIcon(_assetIconLinux),
);

final _textActions = NotificationActions.values
    .where((action) => action.isTextCategory)
    .toList()
    .map(
      (e) => DarwinNotificationAction.text(
        e.actionId,
        e.title,
        buttonTitle: e.buttonTitle ?? '',
        placeholder: e.placeholder,
        options: e.options,
      ),
    )
    .toList();

final _plainActions = NotificationActions.values
    .where((action) => !action.isTextCategory)
    .toList()
    .map(
      (e) => DarwinNotificationAction.plain(
        e.actionId,
        e.title,
        options: e.options,
      ),
    )
    .toList();
