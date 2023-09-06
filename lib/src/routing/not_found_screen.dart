import 'package:flutter/material.dart';

import '../../wvems_protocols.dart';

/// Original source: Andrea Bizzotto
/// https://github.com/bizz84/complete-flutter-course

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EmptyPlaceholderWidget(
        message: '404 - Page not found!'.hardcoded,
      ),
    );
  }
}
