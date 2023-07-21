// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_table_of_contents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PdfTableOfContentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> textList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> textList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfTableOfContentsStateData value) data,
    required TResult Function(PdfTableOfContentsStateLoading value) loading,
    required TResult Function(PdfTableOfContentsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTableOfContentsStateData value)? data,
    TResult? Function(PdfTableOfContentsStateLoading value)? loading,
    TResult? Function(PdfTableOfContentsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTableOfContentsStateData value)? data,
    TResult Function(PdfTableOfContentsStateLoading value)? loading,
    TResult Function(PdfTableOfContentsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfTableOfContentsStateCopyWith<$Res> {
  factory $PdfTableOfContentsStateCopyWith(PdfTableOfContentsState value,
          $Res Function(PdfTableOfContentsState) then) =
      _$PdfTableOfContentsStateCopyWithImpl<$Res, PdfTableOfContentsState>;
}

/// @nodoc
class _$PdfTableOfContentsStateCopyWithImpl<$Res,
        $Val extends PdfTableOfContentsState>
    implements $PdfTableOfContentsStateCopyWith<$Res> {
  _$PdfTableOfContentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PdfTableOfContentsStateDataCopyWith<$Res> {
  factory _$$PdfTableOfContentsStateDataCopyWith(
          _$PdfTableOfContentsStateData value,
          $Res Function(_$PdfTableOfContentsStateData) then) =
      __$$PdfTableOfContentsStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> textList});
}

/// @nodoc
class __$$PdfTableOfContentsStateDataCopyWithImpl<$Res>
    extends _$PdfTableOfContentsStateCopyWithImpl<$Res,
        _$PdfTableOfContentsStateData>
    implements _$$PdfTableOfContentsStateDataCopyWith<$Res> {
  __$$PdfTableOfContentsStateDataCopyWithImpl(
      _$PdfTableOfContentsStateData _value,
      $Res Function(_$PdfTableOfContentsStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textList = null,
  }) {
    return _then(_$PdfTableOfContentsStateData(
      null == textList
          ? _value._textList
          : textList // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$PdfTableOfContentsStateData implements PdfTableOfContentsStateData {
  const _$PdfTableOfContentsStateData(final Map<String, dynamic> textList)
      : _textList = textList;

  final Map<String, dynamic> _textList;
  @override
  Map<String, dynamic> get textList {
    if (_textList is EqualUnmodifiableMapView) return _textList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_textList);
  }

  @override
  String toString() {
    return 'PdfTableOfContentsState.data(textList: $textList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfTableOfContentsStateData &&
            const DeepCollectionEquality().equals(other._textList, _textList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_textList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfTableOfContentsStateDataCopyWith<_$PdfTableOfContentsStateData>
      get copyWith => __$$PdfTableOfContentsStateDataCopyWithImpl<
          _$PdfTableOfContentsStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> textList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return data(textList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> textList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return data?.call(textList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(textList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfTableOfContentsStateData value) data,
    required TResult Function(PdfTableOfContentsStateLoading value) loading,
    required TResult Function(PdfTableOfContentsStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTableOfContentsStateData value)? data,
    TResult? Function(PdfTableOfContentsStateLoading value)? loading,
    TResult? Function(PdfTableOfContentsStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTableOfContentsStateData value)? data,
    TResult Function(PdfTableOfContentsStateLoading value)? loading,
    TResult Function(PdfTableOfContentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfTableOfContentsStateData implements PdfTableOfContentsState {
  const factory PdfTableOfContentsStateData(
      final Map<String, dynamic> textList) = _$PdfTableOfContentsStateData;

  Map<String, dynamic> get textList;
  @JsonKey(ignore: true)
  _$$PdfTableOfContentsStateDataCopyWith<_$PdfTableOfContentsStateData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PdfTableOfContentsStateLoadingCopyWith<$Res> {
  factory _$$PdfTableOfContentsStateLoadingCopyWith(
          _$PdfTableOfContentsStateLoading value,
          $Res Function(_$PdfTableOfContentsStateLoading) then) =
      __$$PdfTableOfContentsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PdfTableOfContentsStateLoadingCopyWithImpl<$Res>
    extends _$PdfTableOfContentsStateCopyWithImpl<$Res,
        _$PdfTableOfContentsStateLoading>
    implements _$$PdfTableOfContentsStateLoadingCopyWith<$Res> {
  __$$PdfTableOfContentsStateLoadingCopyWithImpl(
      _$PdfTableOfContentsStateLoading _value,
      $Res Function(_$PdfTableOfContentsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PdfTableOfContentsStateLoading
    implements PdfTableOfContentsStateLoading {
  const _$PdfTableOfContentsStateLoading();

  @override
  String toString() {
    return 'PdfTableOfContentsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfTableOfContentsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> textList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> textList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfTableOfContentsStateData value) data,
    required TResult Function(PdfTableOfContentsStateLoading value) loading,
    required TResult Function(PdfTableOfContentsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTableOfContentsStateData value)? data,
    TResult? Function(PdfTableOfContentsStateLoading value)? loading,
    TResult? Function(PdfTableOfContentsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTableOfContentsStateData value)? data,
    TResult Function(PdfTableOfContentsStateLoading value)? loading,
    TResult Function(PdfTableOfContentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfTableOfContentsStateLoading
    implements PdfTableOfContentsState {
  const factory PdfTableOfContentsStateLoading() =
      _$PdfTableOfContentsStateLoading;
}

/// @nodoc
abstract class _$$PdfTableOfContentsStateErrorCopyWith<$Res> {
  factory _$$PdfTableOfContentsStateErrorCopyWith(
          _$PdfTableOfContentsStateError value,
          $Res Function(_$PdfTableOfContentsStateError) then) =
      __$$PdfTableOfContentsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$PdfTableOfContentsStateErrorCopyWithImpl<$Res>
    extends _$PdfTableOfContentsStateCopyWithImpl<$Res,
        _$PdfTableOfContentsStateError>
    implements _$$PdfTableOfContentsStateErrorCopyWith<$Res> {
  __$$PdfTableOfContentsStateErrorCopyWithImpl(
      _$PdfTableOfContentsStateError _value,
      $Res Function(_$PdfTableOfContentsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$PdfTableOfContentsStateError(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$PdfTableOfContentsStateError implements PdfTableOfContentsStateError {
  const _$PdfTableOfContentsStateError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PdfTableOfContentsState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfTableOfContentsStateError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfTableOfContentsStateErrorCopyWith<_$PdfTableOfContentsStateError>
      get copyWith => __$$PdfTableOfContentsStateErrorCopyWithImpl<
          _$PdfTableOfContentsStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> textList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> textList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfTableOfContentsStateData value) data,
    required TResult Function(PdfTableOfContentsStateLoading value) loading,
    required TResult Function(PdfTableOfContentsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTableOfContentsStateData value)? data,
    TResult? Function(PdfTableOfContentsStateLoading value)? loading,
    TResult? Function(PdfTableOfContentsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTableOfContentsStateData value)? data,
    TResult Function(PdfTableOfContentsStateLoading value)? loading,
    TResult Function(PdfTableOfContentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfTableOfContentsStateError implements PdfTableOfContentsState {
  const factory PdfTableOfContentsStateError(
          final Object error, final StackTrace stackTrace) =
      _$PdfTableOfContentsStateError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$PdfTableOfContentsStateErrorCopyWith<_$PdfTableOfContentsStateError>
      get copyWith => throw _privateConstructorUsedError;
}
