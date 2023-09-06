import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/ui/views/views.dart';

import '../../wvems_protocols.dart';

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
  product,
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
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
