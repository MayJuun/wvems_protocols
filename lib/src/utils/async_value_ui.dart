import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../wvems_protocols.dart';

/// Original source: Andrea Bizzotto
/// https://github.com/bizz84/complete-flutter-course
///
extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showExceptionAlertDialog(
        context: context,
        title: 'Error'.hardcoded,
        exception: error,
      );
    }
  }
}
