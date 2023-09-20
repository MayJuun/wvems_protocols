import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../wvems_protocols.dart';

class PdfScreen extends ConsumerWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      pdfScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    final state = ref.watch(pdfScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer(builder: (context, ref, child) {
              final pdfBundle = ref.watch(pdfBundleProvider);
              return AsyncValueWidget<PdfBundle?>(
                value: pdfBundle,
                data: (pdfBundle) => pdfBundle == null
                    ? const NoDataLoaded()
                    : DataLoaded(pdf: pdfBundle.pdf),
              );
            }),
      floatingActionButton: FloatingActionButton(
          onPressed:
              ref.read(pdfScreenControllerProvider.notifier).clearActivePdf),
    );
  }
}

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
                  'Please select a protocol:'.hardcoded,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                gapH4,
                Text(
                  'It will load automatically the next time you open this app'
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
                            child: Text(asset.name));
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class DataLoaded extends StatelessWidget {
  const DataLoaded({super.key, required this.pdf});
  final File pdf;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const PdfSearch(),

        // This PDF View fills the whole screen, which means clicking to the side won't close an overlay
        // In theory, GestureDetectors can help...but they won't pass through click inputs if in a stack
        // more info: https://stackoverflow.com/a/75845879
        // if you can set the pass-through to work, use: FocusManager.instance.primaryFocus?.unfocus();
        Expanded(
          child: PDFView(
            filePath: pdf.path,
          ),
        ),
      ],
    );
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(title: const Text('Search Bar Sample')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                Tooltip(
                  message: 'Change brightness mode',
                  child: IconButton(
                    isSelected: isDark,
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                    selectedIcon: const Icon(Icons.brightness_2_outlined),
                  ),
                )
              ],
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
        ),
      ),
    );
  }
}
