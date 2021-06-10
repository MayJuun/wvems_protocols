// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppMessage _$_$_AppMessageFromJson(Map<String, dynamic> json) {
  return _$_AppMessage(
    title: json['title'] as String,
    dateTime: DateTime.parse(json['dateTime'] as String),
    body: json['body'] as String? ?? '',
    beenRead: json['beenRead'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_AppMessageToJson(_$_AppMessage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'dateTime': instance.dateTime.toIso8601String(),
      'body': instance.body,
      'beenRead': instance.beenRead,
    };
