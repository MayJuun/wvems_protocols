// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../wvems_protocols.dart';

class SearchHistory extends Equatable {
  const SearchHistory(this.data);

  final Map<AssetPaths, List<SearchHistoryItem>> data;

  @override
  List<Object> get props => [data];

  Map<String, List<SearchHistoryItem>> toMap() {
    final newMap = <String, List<SearchHistoryItem>>{};
    data.forEach((key, value) {
      newMap[key.name] = value;
    });
    return newMap;
  }

  factory SearchHistory.fromMap(Map<String, dynamic> map) {
    final newMap = <AssetPaths, List<SearchHistoryItem>>{};

    map.forEach((key, value) {
      /// need a random asset just to call this enhanced enum method
      /// probably not the most ideal location for that method (?utils)...but it works
      final assetPath = AssetPaths.values.first.fromString(key);
      if (assetPath == null) {
        throw StateError('Cannot convert asset path from string');
      }

      final stringList = List.from(value);
      final searchItems = <SearchHistoryItem>[];

      for (var item in stringList) {
        searchItems.add(SearchHistoryItem.fromJson(item));
      }
      newMap[assetPath] = searchItems;
    });
    return SearchHistory(newMap);
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
