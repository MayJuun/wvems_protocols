// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppMessage _$AppMessageFromJson(Map<String, dynamic> json) {
  return _AppMessage.fromJson(json);
}

/// @nodoc
mixin _$AppMessage {
  String get title => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  bool get beenRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppMessageCopyWith<AppMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMessageCopyWith<$Res> {
  factory $AppMessageCopyWith(
          AppMessage value, $Res Function(AppMessage) then) =
      _$AppMessageCopyWithImpl<$Res, AppMessage>;
  @useResult
  $Res call({String title, DateTime dateTime, String body, bool beenRead});
}

/// @nodoc
class _$AppMessageCopyWithImpl<$Res, $Val extends AppMessage>
    implements $AppMessageCopyWith<$Res> {
  _$AppMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dateTime = null,
    Object? body = null,
    Object? beenRead = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      beenRead: null == beenRead
          ? _value.beenRead
          : beenRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppMessageCopyWith<$Res>
    implements $AppMessageCopyWith<$Res> {
  factory _$$_AppMessageCopyWith(
          _$_AppMessage value, $Res Function(_$_AppMessage) then) =
      __$$_AppMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, DateTime dateTime, String body, bool beenRead});
}

/// @nodoc
class __$$_AppMessageCopyWithImpl<$Res>
    extends _$AppMessageCopyWithImpl<$Res, _$_AppMessage>
    implements _$$_AppMessageCopyWith<$Res> {
  __$$_AppMessageCopyWithImpl(
      _$_AppMessage _value, $Res Function(_$_AppMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dateTime = null,
    Object? body = null,
    Object? beenRead = null,
  }) {
    return _then(_$_AppMessage(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      beenRead: null == beenRead
          ? _value.beenRead
          : beenRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppMessage implements _AppMessage {
  _$_AppMessage(
      {required this.title,
      required this.dateTime,
      this.body = '',
      this.beenRead = false});

  factory _$_AppMessage.fromJson(Map<String, dynamic> json) =>
      _$$_AppMessageFromJson(json);

  @override
  final String title;
  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final String body;
  @override
  @JsonKey()
  final bool beenRead;

  @override
  String toString() {
    return 'AppMessage(title: $title, dateTime: $dateTime, body: $body, beenRead: $beenRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppMessage &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.beenRead, beenRead) ||
                other.beenRead == beenRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, dateTime, body, beenRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppMessageCopyWith<_$_AppMessage> get copyWith =>
      __$$_AppMessageCopyWithImpl<_$_AppMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppMessageToJson(
      this,
    );
  }
}

abstract class _AppMessage implements AppMessage {
  factory _AppMessage(
      {required final String title,
      required final DateTime dateTime,
      final String body,
      final bool beenRead}) = _$_AppMessage;

  factory _AppMessage.fromJson(Map<String, dynamic> json) =
      _$_AppMessage.fromJson;

  @override
  String get title;
  @override
  DateTime get dateTime;
  @override
  String get body;
  @override
  bool get beenRead;
  @override
  @JsonKey(ignore: true)
  _$$_AppMessageCopyWith<_$_AppMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
