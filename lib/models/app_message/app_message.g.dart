// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppMessage _$_$_AppMessageFromJson(Map<String, dynamic> json) {
  return _$_AppMessage(
    title: json['title'] as String,
    body: json['body'] as String? ??
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    dateTime: json['dateTime'] as String? ?? 'DateTime',
    beenRead: json['beenRead'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_AppMessageToJson(_$_AppMessage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'dateTime': instance.dateTime,
      'beenRead': instance.beenRead,
    };
