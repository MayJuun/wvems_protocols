import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_message.freezed.dart';
part 'app_message.g.dart';

@freezed
class AppMessage with _$AppMessage {
  factory AppMessage({
    required String title,
    @Default('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
        String body,
    //todo: change to datetime
    @Default('DateTime') String dateTime,
    @Default(false) bool beenRead,
  }) = _AppMessage;

  factory AppMessage.fromJson(Map<String, dynamic> json) =>
      _$AppMessageFromJson(json);
}
