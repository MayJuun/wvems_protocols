// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfSearchStateData _$$PdfSearchStateDataFromJson(Map<String, dynamic> json) =>
    _$PdfSearchStateData(
      (json['searchStringDataMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map(
                    (e) => PdfSearchStrings.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PdfSearchStateDataToJson(
        _$PdfSearchStateData instance) =>
    <String, dynamic>{
      'searchStringDataMap': instance.searchStringDataMap
          .map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())),
      'runtimeType': instance.$type,
    };

_$PdfSearchStateHistory _$$PdfSearchStateHistoryFromJson(
        Map<String, dynamic> json) =>
    _$PdfSearchStateHistory(
      (json['searchStringHistoryList'] as List<dynamic>)
          .map((e) => PdfSearchStrings.fromJson(e as Map<String, dynamic>))
          .toSet(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PdfSearchStateHistoryToJson(
        _$PdfSearchStateHistory instance) =>
    <String, dynamic>{
      'searchStringHistoryList':
          instance.searchStringHistoryList.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

_$PdfSearchStateLoading _$$PdfSearchStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$PdfSearchStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PdfSearchStateLoadingToJson(
        _$PdfSearchStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PdfSearchStateError _$$PdfSearchStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$PdfSearchStateError(
      json['error'] as Object,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PdfSearchStateErrorToJson(
        _$PdfSearchStateError instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };
