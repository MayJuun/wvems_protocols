// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_search_strings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfSearchStringsData _$_$PdfSearchStringsDataFromJson(
    Map<String, dynamic> json) {
  return _$PdfSearchStringsData(
    pageNumber: json['pageNumber'] as int,
    pageIndex: json['pageIndex'] as int,
    beforeResult: json['beforeResult'] as String,
    result: json['result'] as String,
    afterResult: json['afterResult'] as String,
  );
}

Map<String, dynamic> _$_$PdfSearchStringsDataToJson(
        _$PdfSearchStringsData instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageIndex': instance.pageIndex,
      'beforeResult': instance.beforeResult,
      'result': instance.result,
      'afterResult': instance.afterResult,
    };
