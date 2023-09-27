import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

class DisplayVersion extends StatelessWidget {
  const DisplayVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MenuContainer(
      roundedMenuEdges: RoundedMenuEdges.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton.filledTonal(
                onPressed: () {
                  ref.read(multipageSyncServiceProvider.notifier).goToHome();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.home),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Column(
              children: [
                Text('Display Version:'.hardcoded, style: textTheme.bodyMedium),
                Consumer(
                  builder: (context, ref, child) {
                    final activeAssetPath =
                        ref.watch(pdfBundleProvider).value?.assetPath;

                    final assetPaths = AssetPaths.values
                        .where((e) => e != AssetPaths.testBundle);

                    return DropdownMenu<AssetPaths>(
                      initialSelection: activeAssetPath,
                      enableSearch: false,
                      dropdownMenuEntries: assetPaths
                          .map(
                            (e) => DropdownMenuEntry(
                              style: ButtonStyle(
                                textStyle: MaterialStatePropertyAll(
                                  textTheme.bodyMedium,
                                ),
                              ),
                              value: e,
                              label: e.condensedTitle,
                            ),
                          )
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
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton.outlined(
                onPressed: () {
                  ref
                      .read(pdfScreenControllerProvider.notifier)
                      .clearActivePdf();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.remove),
              );
            },
          ),
        ],
      ),
    );
  }
}
