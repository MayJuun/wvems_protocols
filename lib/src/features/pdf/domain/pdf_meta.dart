// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

class PdfMeta extends Equatable {
  const PdfMeta(
      {required this.primaryColor, required this.year, required this.version});

  final Color primaryColor;
  final int year;
  final int version;

  @override
  List<Object> get props => [primaryColor, year, version];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primaryColor': primaryColor.toHex(leadingHashSign: false),
      'year': year.toString(),
      'version': version.toString(),
    };
  }

  factory PdfMeta.fromMap(Map<String, dynamic> map) {
    return PdfMeta(
      primaryColor: HexColor.fromHex(map['primaryColor'] as String),
      year: int.parse(map['year']),
      version: int.parse(map['version']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PdfMeta.fromJson(String source) =>
      PdfMeta.fromMap(json.decode(source) as Map<String, dynamic>);
}
