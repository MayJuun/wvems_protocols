// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../wvems_protocols.dart';

class SearchHistory extends Equatable {
  const SearchHistory(this.data);

  final Map<AssetPaths, List<SearchHistoryItem>> data;

  @override
  List<Object> get props => [data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory SearchHistory.fromMap(Map<String, dynamic> map) {
    return SearchHistory(
      Map<AssetPaths, List<SearchHistoryItem>>.from(
        map['data'] as Map<AssetPaths, List<SearchHistoryItem>>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchHistory.fromJson(String source) =>
      SearchHistory.fromMap(json.decode(source) as Map<String, dynamic>);

  SearchHistory copyWith({
    Map<AssetPaths, List<SearchHistoryItem>>? data,
  }) {
    return SearchHistory(
      data ?? this.data,
    );
  }
}
