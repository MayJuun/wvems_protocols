// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_text_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PdfTextListState {
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
    required TResult Function(PdfTextListStateData value) data,
    required TResult Function(PdfTextListStateLoading value) loading,
    required TResult Function(PdfTextListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTextListStateData value)? data,
    TResult? Function(PdfTextListStateLoading value)? loading,
    TResult? Function(PdfTextListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfTextListStateCopyWith<$Res> {
  factory $PdfTextListStateCopyWith(
          PdfTextListState value, $Res Function(PdfTextListState) then) =
      _$PdfTextListStateCopyWithImpl<$Res, PdfTextListState>;
}

/// @nodoc
class _$PdfTextListStateCopyWithImpl<$Res, $Val extends PdfTextListState>
    implements $PdfTextListStateCopyWith<$Res> {
  _$PdfTextListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PdfTextListStateDataCopyWith<$Res> {
  factory _$$PdfTextListStateDataCopyWith(_$PdfTextListStateData value,
          $Res Function(_$PdfTextListStateData) then) =
      __$$PdfTextListStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> textList});
}

/// @nodoc
class __$$PdfTextListStateDataCopyWithImpl<$Res>
    extends _$PdfTextListStateCopyWithImpl<$Res, _$PdfTextListStateData>
    implements _$$PdfTextListStateDataCopyWith<$Res> {
  __$$PdfTextListStateDataCopyWithImpl(_$PdfTextListStateData _value,
      $Res Function(_$PdfTextListStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textList = null,
  }) {
    return _then(_$PdfTextListStateData(
      null == textList
          ? _value._textList
          : textList // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$PdfTextListStateData implements PdfTextListStateData {
  const _$PdfTextListStateData(final Map<String, dynamic> textList)
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
    return 'PdfTextListState.data(textList: $textList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfTextListStateData &&
            const DeepCollectionEquality().equals(other._textList, _textList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_textList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfTextListStateDataCopyWith<_$PdfTextListStateData> get copyWith =>
      __$$PdfTextListStateDataCopyWithImpl<_$PdfTextListStateData>(
          this, _$identity);

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
    required TResult Function(PdfTextListStateData value) data,
    required TResult Function(PdfTextListStateLoading value) loading,
    required TResult Function(PdfTextListStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTextListStateData value)? data,
    TResult? Function(PdfTextListStateLoading value)? loading,
    TResult? Function(PdfTextListStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfTextListStateData implements PdfTextListState {
  const factory PdfTextListStateData(final Map<String, dynamic> textList) =
      _$PdfTextListStateData;

  Map<String, dynamic> get textList;
  @JsonKey(ignore: true)
  _$$PdfTextListStateDataCopyWith<_$PdfTextListStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PdfTextListStateLoadingCopyWith<$Res> {
  factory _$$PdfTextListStateLoadingCopyWith(_$PdfTextListStateLoading value,
          $Res Function(_$PdfTextListStateLoading) then) =
      __$$PdfTextListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PdfTextListStateLoadingCopyWithImpl<$Res>
    extends _$PdfTextListStateCopyWithImpl<$Res, _$PdfTextListStateLoading>
    implements _$$PdfTextListStateLoadingCopyWith<$Res> {
  __$$PdfTextListStateLoadingCopyWithImpl(_$PdfTextListStateLoading _value,
      $Res Function(_$PdfTextListStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PdfTextListStateLoading implements PdfTextListStateLoading {
  const _$PdfTextListStateLoading();

  @override
  String toString() {
    return 'PdfTextListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfTextListStateLoading);
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
    required TResult Function(PdfTextListStateData value) data,
    required TResult Function(PdfTextListStateLoading value) loading,
    required TResult Function(PdfTextListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTextListStateData value)? data,
    TResult? Function(PdfTextListStateLoading value)? loading,
    TResult? Function(PdfTextListStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfTextListStateLoading implements PdfTextListState {
  const factory PdfTextListStateLoading() = _$PdfTextListStateLoading;
}

/// @nodoc
abstract class _$$PdfTextListStateErrorCopyWith<$Res> {
  factory _$$PdfTextListStateErrorCopyWith(_$PdfTextListStateError value,
          $Res Function(_$PdfTextListStateError) then) =
      __$$PdfTextListStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$PdfTextListStateErrorCopyWithImpl<$Res>
    extends _$PdfTextListStateCopyWithImpl<$Res, _$PdfTextListStateError>
    implements _$$PdfTextListStateErrorCopyWith<$Res> {
  __$$PdfTextListStateErrorCopyWithImpl(_$PdfTextListStateError _value,
      $Res Function(_$PdfTextListStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$PdfTextListStateError(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$PdfTextListStateError implements PdfTextListStateError {
  const _$PdfTextListStateError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PdfTextListState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfTextListStateError &&
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
  _$$PdfTextListStateErrorCopyWith<_$PdfTextListStateError> get copyWith =>
      __$$PdfTextListStateErrorCopyWithImpl<_$PdfTextListStateError>(
          this, _$identity);

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
    required TResult Function(PdfTextListStateData value) data,
    required TResult Function(PdfTextListStateLoading value) loading,
    required TResult Function(PdfTextListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfTextListStateData value)? data,
    TResult? Function(PdfTextListStateLoading value)? loading,
    TResult? Function(PdfTextListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfTextListStateError implements PdfTextListState {
  const factory PdfTextListStateError(
          final Object error, final StackTrace stackTrace) =
      _$PdfTextListStateError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$PdfTextListStateErrorCopyWith<_$PdfTextListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
