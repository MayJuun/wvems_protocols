// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:wvems_protocols/wvems_protocols.dart';

typedef StringIndex = int;
typedef LowerCaseQuery = String;

/// the total number of characters listed before & after a search string
const _substring = 20;

class PageTextResult extends Equatable {
  const PageTextResult({
    required this.stringIndex,
    required this.lowerCaseQuery,
    required this.pageText,
  });

  /// Info originally present in PageText maps
  final PageText pageText;

  /// The index (in a given string of pageText) where the query was found
  final StringIndex stringIndex;

  /// The query, already converted to lower case
  final LowerCaseQuery lowerCaseQuery;

  @override
  List<Object> get props => [stringIndex, lowerCaseQuery, pageText];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stringIndex': stringIndex,
      'lowerCaseQuery': lowerCaseQuery,
      'pageText': pageText,
    };
  }

  factory PageTextResult.fromMap(Map<String, dynamic> map) {
    return PageTextResult(
      stringIndex: map['stringIndex'] as int,
      lowerCaseQuery: map['lowerCaseQuery'] as String,
      pageText: map['pageText'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PageTextResult.fromJson(String source) =>
      PageTextResult.fromMap(json.decode(source) as Map<String, dynamic>);

  // The 'before' substring consists of SUBSTRING characters
  // before the search string.
  // Note that pageId starts at 1, not 0
  String before() => pageText.substring(
        stringIndex - _substring < 0 ? 0 : stringIndex - _substring,
        stringIndex,
      );

// The 'after' substring conists of SUBSTRING characters after the search string
  String after() => pageText.substring(
        stringIndex + lowerCaseQuery.length,
        stringIndex + _substring + lowerCaseQuery.length >= pageText.length
            ? pageText.length - 1
            : stringIndex + _substring + lowerCaseQuery.length,
      );
}
