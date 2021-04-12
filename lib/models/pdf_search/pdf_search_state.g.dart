// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfSearchStateData _$_$PdfSearchStateDataFromJson(Map<String, dynamic> json) {
  return _$PdfSearchStateData(
    (json['searchStringDataMap'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => PdfSearchStrings.fromJson(e as Map<String, dynamic>))
              .toList()),
    ),
  );
}

Map<String, dynamic> _$_$PdfSearchStateDataToJson(
        _$PdfSearchStateData instance) =>
    <String, dynamic>{
      'searchStringDataMap': instance.searchStringDataMap
          .map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
    };

_$PdfSearchStateHistory _$_$PdfSearchStateHistoryFromJson(
    Map<String, dynamic> json) {
  return _$PdfSearchStateHistory(
    (json['searchStringHistoryList'] as List<dynamic>)
        .map((e) => PdfSearchStrings.fromJson(e as Map<String, dynamic>))
        .toSet(),
  );
}

Map<String, dynamic> _$_$PdfSearchStateHistoryToJson(
        _$PdfSearchStateHistory instance) =>
    <String, dynamic>{
      'searchStringHistoryList':
          instance.searchStringHistoryList.map((e) => e.toJson()).toList(),
    };

_$PdfSearchStateLoading _$_$PdfSearchStateLoadingFromJson(
    Map<String, dynamic> json) {
  return _$PdfSearchStateLoading();
}

Map<String, dynamic> _$_$PdfSearchStateLoadingToJson(
        _$PdfSearchStateLoading instance) =>
    <String, dynamic>{};

_$PdfSearchStateError _$_$PdfSearchStateErrorFromJson(
    Map<String, dynamic> json) {
  return _$PdfSearchStateError(
    json['error'] as Object,
  );
}

Map<String, dynamic> _$_$PdfSearchStateErrorToJson(
        _$PdfSearchStateError instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
