// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppMessage _$AppMessageFromJson(Map<String, dynamic> json) {
  return _AppMessage.fromJson(json);
}

/// @nodoc
class _$AppMessageTearOff {
  const _$AppMessageTearOff();

  _AppMessage call(
      {required String title,
      required DateTime dateTime,
      String body = '',
      bool beenRead = false}) {
    return _AppMessage(
      title: title,
      dateTime: dateTime,
      body: body,
      beenRead: beenRead,
    );
  }

  AppMessage fromJson(Map<String, Object> json) {
    return AppMessage.fromJson(json);
  }
}

/// @nodoc
const $AppMessage = _$AppMessageTearOff();

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
      _$AppMessageCopyWithImpl<$Res>;
  $Res call({String title, DateTime dateTime, String body, bool beenRead});
}

/// @nodoc
class _$AppMessageCopyWithImpl<$Res> implements $AppMessageCopyWith<$Res> {
  _$AppMessageCopyWithImpl(this._value, this._then);

  final AppMessage _value;
  // ignore: unused_field
  final $Res Function(AppMessage) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? dateTime = freezed,
    Object? body = freezed,
    Object? beenRead = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      beenRead: beenRead == freezed
          ? _value.beenRead
          : beenRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AppMessageCopyWith<$Res> implements $AppMessageCopyWith<$Res> {
  factory _$AppMessageCopyWith(
          _AppMessage value, $Res Function(_AppMessage) then) =
      __$AppMessageCopyWithImpl<$Res>;
  @override
  $Res call({String title, DateTime dateTime, String body, bool beenRead});
}

/// @nodoc
class __$AppMessageCopyWithImpl<$Res> extends _$AppMessageCopyWithImpl<$Res>
    implements _$AppMessageCopyWith<$Res> {
  __$AppMessageCopyWithImpl(
      _AppMessage _value, $Res Function(_AppMessage) _then)
      : super(_value, (v) => _then(v as _AppMessage));

  @override
  _AppMessage get _value => super._value as _AppMessage;

  @override
  $Res call({
    Object? title = freezed,
    Object? dateTime = freezed,
    Object? body = freezed,
    Object? beenRead = freezed,
  }) {
    return _then(_AppMessage(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      beenRead: beenRead == freezed
          ? _value.beenRead
          : beenRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AppMessage implements _AppMessage {
  _$_AppMessage(
      {required this.title,
      required this.dateTime,
      this.body = '',
      this.beenRead = false});

  factory _$_AppMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_AppMessageFromJson(json);

  @override
  final String title;
  @override
  final DateTime dateTime;
  @JsonKey(defaultValue: '')
  @override
  final String body;
  @JsonKey(defaultValue: false)
  @override
  final bool beenRead;

  @override
  String toString() {
    return 'AppMessage(title: $title, dateTime: $dateTime, body: $body, beenRead: $beenRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppMessage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.beenRead, beenRead) ||
                const DeepCollectionEquality()
                    .equals(other.beenRead, beenRead)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(beenRead);

  @JsonKey(ignore: true)
  @override
  _$AppMessageCopyWith<_AppMessage> get copyWith =>
      __$AppMessageCopyWithImpl<_AppMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppMessageToJson(this);
  }
}

abstract class _AppMessage implements AppMessage {
  factory _AppMessage(
      {required String title,
      required DateTime dateTime,
      String body,
      bool beenRead}) = _$_AppMessage;

  factory _AppMessage.fromJson(Map<String, dynamic> json) =
      _$_AppMessage.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  DateTime get dateTime => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  bool get beenRead => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppMessageCopyWith<_AppMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
