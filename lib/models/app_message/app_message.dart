import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_message.freezed.dart';
part 'app_message.g.dart';

@freezed
class AppMessage with _$AppMessage {
  factory AppMessage({
    required String title,
    required DateTime dateTime,
    @Default('')
        String body,
    @Default(false) bool beenRead,
  }) = _AppMessage;

  factory AppMessage.fromJson(Map<String, dynamic> json) =>
      _$AppMessageFromJson(json);
}
