import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../../wvems_protocols.dart';

class PdfSearch extends ConsumerStatefulWidget {
  const PdfSearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PdfSearchState();
}

class _PdfSearchState extends ConsumerState<PdfSearch> {
  final _controller = FloatingSearchBarController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final double searchBarWidth =
        isPortrait ? MediaQuery.of(context).size.width - 48 : 600;

    return SafeArea(
      child: FloatingSearchBar(
          controller: _controller,
          clearQueryOnClose: false,
          hint: 'Search Protocols'.hardcoded,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 48),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: isPortrait ? 0.0 : -1.0,
          elevation: 2,
          border: BorderSide(
              color: Theme.of(context).colorScheme.scrim, width: 0.5),
          openAxisAlignment: 0.0,
          openWidth: searchBarWidth,
          width: searchBarWidth,
          debounceDelay: const Duration(milliseconds: 300),
          onQueryChanged: (query) =>
              ref.read(pdfSearchStateProvider.notifier).updateQuery(query),
          // Specify a custom transition to be used for
          // animating between opened and closed stated.
          transition: CircularFloatingSearchBarTransition(),
          leadingActions: [
            /// This was modified from the original FloatingSearchBarAction.searchToClear() widget
            /// This is because an error exists on the onTap button, where it failed to rebuild after clearing data
            /// That was fixed by wrapping bar.clear(); with setState(() {});
            FloatingSearchBarAction(
              showIfOpened: true,
              showIfClosed: true,
              builder: (BuildContext context, Animation<double> animation) {
                final FloatingSearchAppBarState bar =
                    FloatingSearchAppBar.of(context)!;

                return ValueListenableBuilder<String>(
                  valueListenable: bar.queryNotifer,
                  builder: (BuildContext context, String query, _) {
                    final bool isEmpty = query.isEmpty;

                    return SearchToClear(
                      isEmpty: isEmpty,
                      size: 24,
                      color: bar.style.iconColor,
                      duration: const Duration(milliseconds: 900) * 0.5,
                      onTap: () {
                        if (!isEmpty) {
                          setState(() {
                            bar.clear();
                          });
                        } else {
                          bar.isOpen = !bar.isOpen ||
                              (!bar.hasFocus && bar.isAlwaysOpened);
                        }
                      },
                      searchButtonSemanticLabel: 'Search'.hardcoded,
                      clearButtonSemanticLabel: 'Clear'.hardcoded,
                    );
                  },
                );
              },
            ),
          ],
          actions: [
            FloatingSearchBarAction(
              showIfOpened: true,
              child: Tooltip(
                message: 'Change Version, Settings, Messages'.hardcoded,
                child: CircularButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // TODO(FireJuun): add menu overlay
                  },
                ),
              ),
            ),
          ],
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                // color: Theme.of(context).colorScheme.primaryContainer,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // todo: add filter
                    Consumer(builder: (context, ref, child) {
                      final results =
                          ref.watch(pdfSearchResultsTableOfContentsProvider);

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            List<ListTile>.generate(results.length, (index) {
                          final title = results.entries.elementAt(index).value;
                          return ListTile(
                            dense: true,
                            title: Text(title),
                            onTap: () {
                              _controller.query = title.replaceAll(
                                  ' (cont.)'.toLowerCase(), '');
                              // implement tap
                              _controller.close();
                            },
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
