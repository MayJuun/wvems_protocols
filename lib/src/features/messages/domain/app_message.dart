// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

typedef MessageId = String;

class AppMessage extends Equatable {
  const AppMessage({
    required this.messageId,
    required this.dateTime,
    required this.title,
    this.body = '',
    this.isRead = false,
  });

  final String messageId;
  final DateTime dateTime;
  final String title;
  final String body;
  final bool isRead;

  @override
  List<Object> get props => [messageId, title, dateTime, body, isRead];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageId': messageId,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'title': title,
      'body': body,
      'isRead': isRead,
    };
  }

  factory AppMessage.fromMap(Map<String, dynamic> map) {
    return AppMessage(
      messageId: map['messageId'] as String,
      title: map['title'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      body: map['body'] as String,
      isRead: map['isRead'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppMessage.fromJson(String source) =>
      AppMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  AppMessage copyWith({
    String? messageId,
    String? title,
    DateTime? dateTime,
    String? body,
    bool? isRead,
  }) {
    return AppMessage(
      messageId: messageId ?? this.messageId,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
    );
  }
}
