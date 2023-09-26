import 'package:flutter/material.dart';

import '../../../../wvems_protocols.dart';

const kUnifiedMenuWVEMSKey = Key('unified-menu-wvems-key');
const kUnifiedMenuMayJuunKey = Key('unified-menu-mayjuun-key');

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showUnifiedMenuDialog({required BuildContext context}) async {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: OrientationBuilder(builder: (context, orientation) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height - 256
                    : double.infinity,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: const SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _MenuHeader(),
                      DisplayVersion(),
                      AppLinks(),
                      AppMessages(),
                      DisplayMode(),
                      _MenuFooter(),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      });
}

class _MenuHeader extends StatelessWidget {
  const _MenuHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop()),
        Text(
          'WVEMS Protocols'.hardcoded,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge?.apply(fontWeightDelta: 2),
        ),
        gapW32,
      ],
    );
  }
}

class _MenuFooter extends StatelessWidget {
  const _MenuFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          key: kUnifiedMenuWVEMSKey,
          child: Text('About WVEMS'.hardcoded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        const Icon(Icons.circle, size: 6.0),
        TextButton(
          key: kUnifiedMenuMayJuunKey,
          child: Text('About MayJuun'.hardcoded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
