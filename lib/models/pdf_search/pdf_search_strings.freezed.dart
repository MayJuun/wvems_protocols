// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pdf_search_strings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PdfSearchStrings _$PdfSearchStringsFromJson(Map<String, dynamic> json) {
  return PdfSearchStringsData.fromJson(json);
}

/// @nodoc
class _$PdfSearchStringsTearOff {
  const _$PdfSearchStringsTearOff();

  PdfSearchStringsData call(
      {required int pageNumber,
      required int pageIndex,
      required String beforeResult,
      required String result,
      required String afterResult}) {
    return PdfSearchStringsData(
      pageNumber: pageNumber,
      pageIndex: pageIndex,
      beforeResult: beforeResult,
      result: result,
      afterResult: afterResult,
    );
  }

  PdfSearchStrings fromJson(Map<String, Object> json) {
    return PdfSearchStrings.fromJson(json);
  }
}

/// @nodoc
const $PdfSearchStrings = _$PdfSearchStringsTearOff();

/// @nodoc
mixin _$PdfSearchStrings {
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageIndex => throw _privateConstructorUsedError;
  String get beforeResult => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get afterResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfSearchStringsCopyWith<PdfSearchStrings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfSearchStringsCopyWith<$Res> {
  factory $PdfSearchStringsCopyWith(
          PdfSearchStrings value, $Res Function(PdfSearchStrings) then) =
      _$PdfSearchStringsCopyWithImpl<$Res>;
  $Res call(
      {int pageNumber,
      int pageIndex,
      String beforeResult,
      String result,
      String afterResult});
}

/// @nodoc
class _$PdfSearchStringsCopyWithImpl<$Res>
    implements $PdfSearchStringsCopyWith<$Res> {
  _$PdfSearchStringsCopyWithImpl(this._value, this._then);

  final PdfSearchStrings _value;
  // ignore: unused_field
  final $Res Function(PdfSearchStrings) _then;

  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? pageIndex = freezed,
    Object? beforeResult = freezed,
    Object? result = freezed,
    Object? afterResult = freezed,
  }) {
    return _then(_value.copyWith(
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageIndex: pageIndex == freezed
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      beforeResult: beforeResult == freezed
          ? _value.beforeResult
          : beforeResult // ignore: cast_nullable_to_non_nullable
              as String,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      afterResult: afterResult == freezed
          ? _value.afterResult
          : afterResult // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $PdfSearchStringsDataCopyWith<$Res>
    implements $PdfSearchStringsCopyWith<$Res> {
  factory $PdfSearchStringsDataCopyWith(PdfSearchStringsData value,
          $Res Function(PdfSearchStringsData) then) =
      _$PdfSearchStringsDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int pageNumber,
      int pageIndex,
      String beforeResult,
      String result,
      String afterResult});
}

/// @nodoc
class _$PdfSearchStringsDataCopyWithImpl<$Res>
    extends _$PdfSearchStringsCopyWithImpl<$Res>
    implements $PdfSearchStringsDataCopyWith<$Res> {
  _$PdfSearchStringsDataCopyWithImpl(
      PdfSearchStringsData _value, $Res Function(PdfSearchStringsData) _then)
      : super(_value, (v) => _then(v as PdfSearchStringsData));

  @override
  PdfSearchStringsData get _value => super._value as PdfSearchStringsData;

  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? pageIndex = freezed,
    Object? beforeResult = freezed,
    Object? result = freezed,
    Object? afterResult = freezed,
  }) {
    return _then(PdfSearchStringsData(
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageIndex: pageIndex == freezed
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      beforeResult: beforeResult == freezed
          ? _value.beforeResult
          : beforeResult // ignore: cast_nullable_to_non_nullable
              as String,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      afterResult: afterResult == freezed
          ? _value.afterResult
          : afterResult // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfSearchStringsData implements PdfSearchStringsData {
  const _$PdfSearchStringsData(
      {required this.pageNumber,
      required this.pageIndex,
      required this.beforeResult,
      required this.result,
      required this.afterResult});

  factory _$PdfSearchStringsData.fromJson(Map<String, dynamic> json) =>
      _$$PdfSearchStringsDataFromJson(json);

  @override
  final int pageNumber;
  @override
  final int pageIndex;
  @override
  final String beforeResult;
  @override
  final String result;
  @override
  final String afterResult;

  @override
  String toString() {
    return 'PdfSearchStrings(pageNumber: $pageNumber, pageIndex: $pageIndex, beforeResult: $beforeResult, result: $result, afterResult: $afterResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfSearchStringsData &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.beforeResult, beforeResult) ||
                const DeepCollectionEquality()
                    .equals(other.beforeResult, beforeResult)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.afterResult, afterResult) ||
                const DeepCollectionEquality()
                    .equals(other.afterResult, afterResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(beforeResult) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(afterResult);

  @JsonKey(ignore: true)
  @override
  $PdfSearchStringsDataCopyWith<PdfSearchStringsData> get copyWith =>
      _$PdfSearchStringsDataCopyWithImpl<PdfSearchStringsData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfSearchStringsDataToJson(this);
  }
}

abstract class PdfSearchStringsData implements PdfSearchStrings {
  const factory PdfSearchStringsData(
      {required int pageNumber,
      required int pageIndex,
      required String beforeResult,
      required String result,
      required String afterResult}) = _$PdfSearchStringsData;

  factory PdfSearchStringsData.fromJson(Map<String, dynamic> json) =
      _$PdfSearchStringsData.fromJson;

  @override
  int get pageNumber => throw _privateConstructorUsedError;
  @override
  int get pageIndex => throw _privateConstructorUsedError;
  @override
  String get beforeResult => throw _privateConstructorUsedError;
  @override
  String get result => throw _privateConstructorUsedError;
  @override
  String get afterResult => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PdfSearchStringsDataCopyWith<PdfSearchStringsData> get copyWith =>
      throw _privateConstructorUsedError;
}
