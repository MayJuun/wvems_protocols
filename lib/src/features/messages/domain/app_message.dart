// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

typedef MessageId = String;

class AppMessage extends Equatable {
  const AppMessage({
    required this.messageId,
    required this.randomId,
    required this.dateTime,
    required this.title,
    this.body = '',
    this.payload,
    this.isRead = false,
  });

  /// Used for finding the unique iteration of a notification
  /// This should not be repeated
  final MessageId messageId;

  /// Used for local notifications, so that two notifications
  /// don't overwrite each other on accident.
  final int randomId;
  final DateTime dateTime;
  final String title;
  final String body;
  final Map<String, dynamic>? payload;
  final bool isRead;

  @override
  List<Object?> get props =>
      [messageId, randomId, title, dateTime, body, payload, isRead];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageId': messageId,
      'randomId': randomId,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'title': title,
      'body': body,
      'payload': payload,
      'isRead': isRead,
    };
  }

  factory AppMessage.fromMap(Map<String, dynamic> map) {
    return AppMessage(
      messageId: map['messageId'] as String,
      randomId: map['randomId'] as int,
      title: map['title'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      body: map['body'] as String,
      payload: map['payload'] as Map<String, dynamic>,
      isRead: map['isRead'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppMessage.fromJson(String source) =>
      AppMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  AppMessage copyWith({
    String? messageId,
    int? randomId,
    String? title,
    DateTime? dateTime,
    String? body,
    Map<String, dynamic>? payload,
    bool? isRead,
  }) {
    return AppMessage(
      messageId: messageId ?? this.messageId,
      randomId: randomId ?? this.randomId,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      body: body ?? this.body,
      payload: payload ?? this.payload,
      isRead: isRead ?? this.isRead,
    );
  }
}
