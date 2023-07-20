import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';

/// This shows the 'history' of previous items that have been searched for in the past
class SearchDataItem extends StatelessWidget {
  const SearchDataItem({Key? key, required this.searchStrings})
      : super(key: key);

  final PdfSearchStrings searchStrings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final PdfSearchController pdfSearchController = Get.find();
    // final PdfStateController pdfStateController = Get.find();
    // final pdfPageText = pdfStateController.pdfSearchState;
    final ThemeController themeController = Get.find();
    final appTheme =
        themeController.getAppThemeFromBrightness(Theme.of(context).brightness);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            //todo: this is where we will go to the next page
            FloatingSearchBar.of(context)?.close();
            SearchItemSelectedCommand()
                .execute(pdfSearchStrings: searchStrings);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    // todo: reimplement
                    child: Obx(
                      () => pdfSearchController.pdfSearchState.value.maybeWhen(
                        data: (data) => const Icon(Icons.find_in_page_outlined,
                            key: Key('search')),
                        history: (history) =>
                            const Icon(Icons.history, key: Key('history')),
                        orElse: () => Container(),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(width: 16),
                Expanded(
                    child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '...${searchStrings.beforeResult}',
                        style: textTheme.bodyMedium!
                            .copyWith(color: appTheme.grey),
                      ),
                      TextSpan(
                        text: searchStrings.result,
                        style: const TextStyle(fontWeight: FontWeight.bold)
                            .copyWith(color: appTheme.grey),
                      ),
                      TextSpan(
                        text: '${searchStrings.afterResult}...',
                        style: textTheme.bodyMedium!
                            .copyWith(color: appTheme.grey),
                      ),
                    ],
                  ),
                )),
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
