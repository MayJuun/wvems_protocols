import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../wvems_protocols.dart';

class NoDataLoaded extends StatelessWidget {
  const NoDataLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final assetPaths =
        AssetPaths.values.where((e) => e != AssetPaths.TestBundle);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Please select a protocol year:'.hardcoded,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                gapH24,
                Text(
                  'It will load automatically whenever this app opens.'
                      .hardcoded,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            gapH32,
            Wrap(
              spacing: 8.0,
              runSpacing: 12.0,
              children: assetPaths
                  .map((asset) => Consumer(builder: (context, ref, child) {
                        return ElevatedButton(
                            onPressed: () => ref
                                .read(pdfScreenControllerProvider.notifier)
                                .loadPdfFromAsset(asset),
                            child: Text(asset.title));
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
