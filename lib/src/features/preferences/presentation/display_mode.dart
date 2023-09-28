import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import 'package:wvems_protocols/wvems_protocols.dart';

class DisplayMode extends StatelessWidget {
  const DisplayMode({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MenuContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Display Mode:'.hardcoded, style: textTheme.bodyMedium),
          Consumer(
            builder: (context, ref, child) {
              final appThemeMode =
                  ref.watch(appThemeChangesProvider).value?.themeMode ??
                      ThemeMode.system;

              return DropdownMenu<ThemeMode>(
                initialSelection: appThemeMode,
                enableSearch: false,
                dropdownMenuEntries: ThemeMode.values
                    .map(
                      (e) => DropdownMenuEntry(
                        style: ButtonStyle(
                          textStyle:
                              MaterialStatePropertyAll(textTheme.bodyMedium),
                        ),
                        value: e,
                        label: toBeginningOfSentenceCase(e.name) ?? '',
                      ),
                    )
                    .toList(),
                onSelected: (themeMode) {
                  if (themeMode != null) {
                    ref
                        .read(themeRepositoryProvider)
                        .setAppThemeMode(themeMode);
                  } else {
                    throw StateError('No theme selected');
                  }

                  Navigator.of(context).pop();
                },
                inputDecorationTheme: const InputDecorationTheme(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  isCollapsed: true,
                  isDense: true,
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints.tightForFinite(height: 40),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
