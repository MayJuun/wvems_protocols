import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    /// Instead of this, we use LocalNotificationsService.handleAppLaunch()
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        await ref
            .read(localNotificationsServiceProvider)
            .handleMessageOpened(message);
      }
    });

    /// Used for Android foreground messages only
    FirebaseMessaging.onMessage.listen(
      ref.read(firebaseMessagingRepositoryProvider).addRemoteMessage,
    );

    /// Used for Android and iOS message events when in background mode
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) => ref
          .read(localNotificationsServiceProvider)
          .handleMessageOpened(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    final themeRepository = ref.watch(themeRepositoryProvider);
    final appTheme = useStream(themeRepository.appThemeChanges);
    useOnAppLifecycleStateChange((previous, next) async {
      if (next == AppLifecycleState.resumed) {
        await ref.read(localNotificationsServiceProvider).handleAppResumed();
      }
    });

    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'WVEMS Protocols'.hardcoded,
      themeMode: appTheme.data?.themeMode,
      theme: themeRepository.lightTheme,
      darkTheme: themeRepository.darkTheme,
    );
  }
}
