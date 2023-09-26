// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../wvems_protocols.dart';

class SearchHistoryItem extends Equatable {
  const SearchHistoryItem(
      {required this.pageId, this.pageTextResult, this.tableOfContentsResult});

  final PageId pageId;
  final PageTextResult? pageTextResult;
  final String? tableOfContentsResult;

  @override
  List<Object?> get props => [pageId, pageTextResult, pdfTableOfContents];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageId': pageId,
      'pageTextResult': pageTextResult?.toMap(),
      'pdfTableOfContents': tableOfContentsResult,
    };
  }

  factory SearchHistoryItem.fromMap(Map<String, dynamic> map) {
    return SearchHistoryItem(
      pageId: map['pageId'] as int,
      pageTextResult: map['pageTextResult'] != null
          ? PageTextResult.fromMap(
              map['pageTextResult'] as Map<String, dynamic>)
          : null,
      tableOfContentsResult: map['pdfTableOfContents'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchHistoryItem.fromJson(String source) =>
      SearchHistoryItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
