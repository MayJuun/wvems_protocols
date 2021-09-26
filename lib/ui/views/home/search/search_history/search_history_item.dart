import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:quick_reference/controllers/commands/commands.dart';
import 'package:quick_reference/controllers/controllers.dart';
import 'package:quick_reference/models/models.dart';

/// This shows the 'history' of previous items that have been searched for in the past
class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({Key? key, required this.searchStrings})
      : super(key: key);

  final PdfSearchStrings searchStrings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final SearchController searchController = Get.find();
    // final PdfStateController pdfStateController = Get.find();
    // final pdfPageText = pdfStateController.pdfSearchState;
    final ThemeController themeController = Get.find();
    final appTheme =
        themeController.getAppThemeFromBrightness(Theme.of(context).brightness);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onLongPress: () {
            FloatingSearchBar.of(context)?.close();
            SearchItemRemovedCommand().execute(pdfSearchStrings: searchStrings);
          },
          onTap: () {
            FloatingSearchBar.of(context)?.close();
            SearchItemSelectedCommand()
                .execute(pdfSearchStrings: searchStrings);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    // todo: reimplement
                    child: Obx(
                      () => searchController.pdfSearchState.value.maybeWhen(
                        data: (data) => const Icon(Icons.find_in_page_outlined,
                            key: Key('search')),
                        history: (history) =>
                            const Icon(Icons.history, key: Key('history')),
                        orElse: () => Container(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // todo: search terms go here
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '...${searchStrings.beforeResult}',
                              style: textTheme.bodyText2!
                                  .copyWith(color: appTheme.grey),
                            ),
                            TextSpan(
                              text: searchStrings.result,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)
                                      .copyWith(color: appTheme.grey),
                            ),
                            TextSpan(
                              text: '${searchStrings.afterResult}...',
                              style: textTheme.bodyText2!
                                  .copyWith(color: appTheme.grey),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 2),
                      Text(
                        'page ${searchStrings.pageNumber}',
                        style:
                            textTheme.bodyText2!.copyWith(color: appTheme.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // if (model.suggestions.isNotEmpty && text != model.suggestions.last)
        //   const Divider(height: 0),
      ],
    );
  }
}
