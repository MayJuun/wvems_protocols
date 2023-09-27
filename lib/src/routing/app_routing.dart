import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

part 'app_routing.g.dart';

/// Original source: Andrea Bizzotto
/// https://github.com/bizz84/complete-flutter-course

/// All the supported routes in the app.
/// By using an enum, we route by name using this syntax:
/// ```dart
/// context.goNamed(AppRoute.home.name)
/// ```
enum AppRoute {
  home,
  menu,
  aboutMayJuun,
  aboutWVEMS,
}

/// returns the GoRouter instance that defines all the routes in the app
@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  // final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => const PdfScreen(),
          routes: [
            GoRoute(
              path: 'menu',
              name: AppRoute.menu.name,
              pageBuilder: (context, state) => DialogPage(
                builder: (_) => const UnifiedMenuDialog(),
              ),
            ),
            GoRoute(
              path: 'aboutMayJuun',
              name: AppRoute.aboutMayJuun.name,
              pageBuilder: (context, state) => DialogPage(
                builder: (_) => const AboutMayJuun(),
              ),
            ),
            GoRoute(
              path: 'aboutWVEMS',
              name: AppRoute.aboutWVEMS.name,
              pageBuilder: (context, state) => DialogPage(
                builder: (_) => const AboutWVEMS(),
              ),
            ),
          ],),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
