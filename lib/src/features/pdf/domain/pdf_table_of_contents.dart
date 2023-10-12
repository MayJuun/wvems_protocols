// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:wvems_protocols/src/features/pdf/domain/export.dart';

typedef TableOfContents = String;

class PdfTableOfContents extends Equatable {
  const PdfTableOfContents(this.data);

  final Map<PageId, TableOfContents> data;

  @override
  List<Object> get props => [data];

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    for (final e in data.entries) {
      map['${e.key}'] = e.value;
    }

    return map;
  }

  factory PdfTableOfContents.fromMap(Map<String, dynamic> map) {
    final data = <int, String>{};
    try {
      for (final e in map.entries) {
        final pageId = int.parse(e.key);
        assert(
          pageId > 0,
          'Page should be a number greater than 0, else index is out of range',
        );
        data[pageId] = e.value as String;
      }
    } catch (error) {
      throw StateError('Invalid table of contents data');
    }
    return PdfTableOfContents(data);
  }

  String toJson() => json.encode(toMap());

  factory PdfTableOfContents.fromJson(String source) =>
      PdfTableOfContents.fromMap(json.decode(source) as Map<String, dynamic>);
}
