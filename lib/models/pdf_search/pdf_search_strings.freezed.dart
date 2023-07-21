// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_search_strings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PdfSearchStrings _$PdfSearchStringsFromJson(Map<String, dynamic> json) {
  return PdfSearchStringsData.fromJson(json);
}

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
      _$PdfSearchStringsCopyWithImpl<$Res, PdfSearchStrings>;
  @useResult
  $Res call(
      {int pageNumber,
      int pageIndex,
      String beforeResult,
      String result,
      String afterResult});
}

/// @nodoc
class _$PdfSearchStringsCopyWithImpl<$Res, $Val extends PdfSearchStrings>
    implements $PdfSearchStringsCopyWith<$Res> {
  _$PdfSearchStringsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageIndex = null,
    Object? beforeResult = null,
    Object? result = null,
    Object? afterResult = null,
  }) {
    return _then(_value.copyWith(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      beforeResult: null == beforeResult
          ? _value.beforeResult
          : beforeResult // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      afterResult: null == afterResult
          ? _value.afterResult
          : afterResult // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PdfSearchStringsDataCopyWith<$Res>
    implements $PdfSearchStringsCopyWith<$Res> {
  factory _$$PdfSearchStringsDataCopyWith(_$PdfSearchStringsData value,
          $Res Function(_$PdfSearchStringsData) then) =
      __$$PdfSearchStringsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pageNumber,
      int pageIndex,
      String beforeResult,
      String result,
      String afterResult});
}

/// @nodoc
class __$$PdfSearchStringsDataCopyWithImpl<$Res>
    extends _$PdfSearchStringsCopyWithImpl<$Res, _$PdfSearchStringsData>
    implements _$$PdfSearchStringsDataCopyWith<$Res> {
  __$$PdfSearchStringsDataCopyWithImpl(_$PdfSearchStringsData _value,
      $Res Function(_$PdfSearchStringsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageIndex = null,
    Object? beforeResult = null,
    Object? result = null,
    Object? afterResult = null,
  }) {
    return _then(_$PdfSearchStringsData(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      beforeResult: null == beforeResult
          ? _value.beforeResult
          : beforeResult // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      afterResult: null == afterResult
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
        (other.runtimeType == runtimeType &&
            other is _$PdfSearchStringsData &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.beforeResult, beforeResult) ||
                other.beforeResult == beforeResult) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.afterResult, afterResult) ||
                other.afterResult == afterResult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageNumber, pageIndex, beforeResult, result, afterResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfSearchStringsDataCopyWith<_$PdfSearchStringsData> get copyWith =>
      __$$PdfSearchStringsDataCopyWithImpl<_$PdfSearchStringsData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfSearchStringsDataToJson(
      this,
    );
  }
}

abstract class PdfSearchStringsData implements PdfSearchStrings {
  const factory PdfSearchStringsData(
      {required final int pageNumber,
      required final int pageIndex,
      required final String beforeResult,
      required final String result,
      required final String afterResult}) = _$PdfSearchStringsData;

  factory PdfSearchStringsData.fromJson(Map<String, dynamic> json) =
      _$PdfSearchStringsData.fromJson;

  @override
  int get pageNumber;
  @override
  int get pageIndex;
  @override
  String get beforeResult;
  @override
  String get result;
  @override
  String get afterResult;
  @override
  @JsonKey(ignore: true)
  _$$PdfSearchStringsDataCopyWith<_$PdfSearchStringsData> get copyWith =>
      throw _privateConstructorUsedError;
}
