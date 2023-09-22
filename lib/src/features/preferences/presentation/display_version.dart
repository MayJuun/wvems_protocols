import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../wvems_protocols.dart';

class DisplayVersion extends StatelessWidget {
  const DisplayVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer(builder: (context, ref, child) {
            return IconButton.filledTonal(
              onPressed: () {
                ref.read(pdfNavigatorControllerProvider.notifier).goToHome();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.home),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Column(
              children: [
                Text('Display Version:'.hardcoded, style: textTheme.bodyLarge),
                Consumer(builder: (context, ref, child) {
                  final activeAssetPath =
                      ref.watch(pdfBundleProvider).value?.assetPath;

                  final assetPaths = AssetPaths.values
                      .where((e) => e != AssetPaths.TestBundle);

                  return DropdownMenu<AssetPaths>(
                    initialSelection: activeAssetPath,
                    enableSearch: false,
                    dropdownMenuEntries: assetPaths
                        .map((e) => DropdownMenuEntry(
                              value: e,
                              label: e.condensedTitle,
                            ))
                        .toList(),
                    onSelected: (asset) {
                      if (asset == null) {
                        ref
                            .read(pdfScreenControllerProvider.notifier)
                            .clearActivePdf();
                      } else {
                        ref
                            .read(pdfScreenControllerProvider.notifier)
                            .loadPdfFromAsset(asset);
                      }
                      Navigator.of(context).pop();
                    },
                    inputDecorationTheme: const InputDecorationTheme(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 0,
                      ),
                      isCollapsed: true,
                      isDense: true,
                      border: OutlineInputBorder(),
                      constraints: BoxConstraints.tightForFinite(height: 40),
                    ),
                    menuStyle: const MenuStyle(
                        visualDensity: VisualDensity.compact,
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 0, horizontal: 8))),
                  );
                })
              ],
            ),
          ),
          Consumer(builder: (context, ref, child) {
            return IconButton.outlined(
                onPressed: () {
                  ref
                      .read(pdfScreenControllerProvider.notifier)
                      .clearActivePdf();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.remove));
          }),
        ],
      ),
    );
  }
}
