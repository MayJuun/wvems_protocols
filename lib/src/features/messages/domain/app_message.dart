// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppMessage extends Equatable {
  const AppMessage({
    required this.title,
    required this.dateTime,
    this.body = '',
    this.beenRead = false,
  });

  final String title;
  final DateTime dateTime;
  final String body;
  final bool beenRead;

  @override
  List<Object> get props => [title, dateTime, body, beenRead];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'body': body,
      'beenRead': beenRead,
    };
  }

  factory AppMessage.fromMap(Map<String, dynamic> map) {
    return AppMessage(
      title: map['title'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      body: map['body'] as String,
      beenRead: map['beenRead'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppMessage.fromJson(String source) =>
      AppMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  AppMessage copyWith({
    String? title,
    DateTime? dateTime,
    String? body,
    bool? beenRead,
  }) {
    return AppMessage(
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      body: body ?? this.body,
      beenRead: beenRead ?? this.beenRead,
    );
  }
}
