import 'package:flutter/material.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/ui/views/home/search/search_data/search_data_item.dart';
import 'package:wvems_protocols/ui/views/home/search/search_data/search_data_toc_title.dart';

class SearchDataList extends StatelessWidget {
  const SearchDataList({Key? key, required this.searchStringsList})
      : super(key: key);

  final List<PdfSearchStrings> searchStringsList;

  @override
  Widget build(BuildContext context) {
    final pageNum = searchStringsList.first.pageNumber;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // page number
            Text('Page $pageNum'),

            // title on the right
            SearchDataTocTitle(pageNumber: pageNum),
          ]),
          ...searchStringsList.map(
            (e) => SearchDataItem(searchStrings: e),
          )
        ],
      ),
    );
  }
}
