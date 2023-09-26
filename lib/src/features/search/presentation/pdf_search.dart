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
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final double searchBarWidth =
        isPortrait ? MediaQuery.of(context).size.width - 48 : 400;
    const double minimizedWidth = 144;

    return SafeArea(
      child: FloatingSearchBar(
          // scrollController: _scrollController,
          // isScrollControlled: true,
          autocorrect: false,
          automaticallyImplyBackButton: false,
          controller: _controller,
          clearQueryOnClose: false,
          hint: 'Search Protocols'.hardcoded,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 48),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: 0,
          elevation: 2,
          border: BorderSide(
              color: Theme.of(context).colorScheme.scrim, width: 0.5),
          openAxisAlignment: 0.0,
          openWidth: searchBarWidth,
          width: isPortrait ? searchBarWidth : minimizedWidth,
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
                    showUnifiedMenuDialog(context: context);
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
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * .65
                          : double.infinity),
                  child: CustomScrollView(
                    controller: _scrollController,
                    shrinkWrap: true,
                    slivers: [
                      SliverMainAxisGroup(
                        slivers: [
                          /// Header (+ filter chips)
                          const SliverPersistentHeader(
                            pinned: true,
                            delegate: ResultsHeader(),
                          ),

                          /// Table of Contents, or other based on what's selected in the filter chip
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 8.0),
                            sliver: Consumer(builder: (context, ref, child) {
                              final pdfSearchFilter =
                                  ref.watch(pdfSearchFilterProvider);

                              switch (pdfSearchFilter) {
                                case PdfSearchFilters.tableOfContents:
                                  return ResultsTableOfContents(_controller);

                                case PdfSearchFilters.pageText:
                                  return ResultsPageText(_controller);
                                case PdfSearchFilters.history:
                                  return ResultsHistory(_controller);
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
