// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:wvems_protocols/src/features/pdf/domain/pdf_bundle.dart';

typedef PageText = String;

class PdfText extends Equatable {
  const PdfText(this.data);

  final Map<PageId, PageText> data;

  @override
  List<Object> get props => [data];

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    data.entries.forEach((e) {
      map['${e.key}'] = e.value;
    });

    return map;
  }

  factory PdfText.fromMap(Map<String, dynamic> map) {
    final data = <int, String>{};
    try {
      map.entries.forEach((e) {
        final pageId = int.parse(e.key);
        assert(pageId > 0,
            'Page should be a number greater than 0, otherwise the index will be out of range');
        data[pageId] = e.value;
      });
    } catch (error) {
      throw StateError('Invalid PDF text data');
    }
    return PdfText(data);
  }

  String toJson() => json.encode(toMap());

  factory PdfText.fromJson(String source) =>
      PdfText.fromMap(json.decode(source) as Map<String, dynamic>);
}
