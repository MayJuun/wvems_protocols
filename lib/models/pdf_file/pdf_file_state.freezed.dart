// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_file_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PdfFileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfFileStateData value) data,
    required TResult Function(PdfFileStateLoading value) loading,
    required TResult Function(PdfFileStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfFileStateData value)? data,
    TResult? Function(PdfFileStateLoading value)? loading,
    TResult? Function(PdfFileStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfFileStateData value)? data,
    TResult Function(PdfFileStateLoading value)? loading,
    TResult Function(PdfFileStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfFileStateCopyWith<$Res> {
  factory $PdfFileStateCopyWith(
          PdfFileState value, $Res Function(PdfFileState) then) =
      _$PdfFileStateCopyWithImpl<$Res, PdfFileState>;
}

/// @nodoc
class _$PdfFileStateCopyWithImpl<$Res, $Val extends PdfFileState>
    implements $PdfFileStateCopyWith<$Res> {
  _$PdfFileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PdfFileStateDataCopyWith<$Res> {
  factory _$$PdfFileStateDataCopyWith(
          _$PdfFileStateData value, $Res Function(_$PdfFileStateData) then) =
      __$$PdfFileStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$PdfFileStateDataCopyWithImpl<$Res>
    extends _$PdfFileStateCopyWithImpl<$Res, _$PdfFileStateData>
    implements _$$PdfFileStateDataCopyWith<$Res> {
  __$$PdfFileStateDataCopyWithImpl(
      _$PdfFileStateData _value, $Res Function(_$PdfFileStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$PdfFileStateData(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$PdfFileStateData implements PdfFileStateData {
  const _$PdfFileStateData(this.file);

  @override
  final File file;

  @override
  String toString() {
    return 'PdfFileState.data(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfFileStateData &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfFileStateDataCopyWith<_$PdfFileStateData> get copyWith =>
      __$$PdfFileStateDataCopyWithImpl<_$PdfFileStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return data(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return data?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfFileStateData value) data,
    required TResult Function(PdfFileStateLoading value) loading,
    required TResult Function(PdfFileStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfFileStateData value)? data,
    TResult? Function(PdfFileStateLoading value)? loading,
    TResult? Function(PdfFileStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfFileStateData value)? data,
    TResult Function(PdfFileStateLoading value)? loading,
    TResult Function(PdfFileStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfFileStateData implements PdfFileState {
  const factory PdfFileStateData(final File file) = _$PdfFileStateData;

  File get file;
  @JsonKey(ignore: true)
  _$$PdfFileStateDataCopyWith<_$PdfFileStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PdfFileStateLoadingCopyWith<$Res> {
  factory _$$PdfFileStateLoadingCopyWith(_$PdfFileStateLoading value,
          $Res Function(_$PdfFileStateLoading) then) =
      __$$PdfFileStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PdfFileStateLoadingCopyWithImpl<$Res>
    extends _$PdfFileStateCopyWithImpl<$Res, _$PdfFileStateLoading>
    implements _$$PdfFileStateLoadingCopyWith<$Res> {
  __$$PdfFileStateLoadingCopyWithImpl(
      _$PdfFileStateLoading _value, $Res Function(_$PdfFileStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PdfFileStateLoading implements PdfFileStateLoading {
  const _$PdfFileStateLoading();

  @override
  String toString() {
    return 'PdfFileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PdfFileStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? data,
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
    required TResult Function(PdfFileStateData value) data,
    required TResult Function(PdfFileStateLoading value) loading,
    required TResult Function(PdfFileStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfFileStateData value)? data,
    TResult? Function(PdfFileStateLoading value)? loading,
    TResult? Function(PdfFileStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfFileStateData value)? data,
    TResult Function(PdfFileStateLoading value)? loading,
    TResult Function(PdfFileStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfFileStateLoading implements PdfFileState {
  const factory PdfFileStateLoading() = _$PdfFileStateLoading;
}

/// @nodoc
abstract class _$$PdfFileStateErrorCopyWith<$Res> {
  factory _$$PdfFileStateErrorCopyWith(
          _$PdfFileStateError value, $Res Function(_$PdfFileStateError) then) =
      __$$PdfFileStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$PdfFileStateErrorCopyWithImpl<$Res>
    extends _$PdfFileStateCopyWithImpl<$Res, _$PdfFileStateError>
    implements _$$PdfFileStateErrorCopyWith<$Res> {
  __$$PdfFileStateErrorCopyWithImpl(
      _$PdfFileStateError _value, $Res Function(_$PdfFileStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$PdfFileStateError(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$PdfFileStateError implements PdfFileStateError {
  const _$PdfFileStateError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PdfFileState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfFileStateError &&
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
  _$$PdfFileStateErrorCopyWith<_$PdfFileStateError> get copyWith =>
      __$$PdfFileStateErrorCopyWithImpl<_$PdfFileStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? data,
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
    required TResult Function(PdfFileStateData value) data,
    required TResult Function(PdfFileStateLoading value) loading,
    required TResult Function(PdfFileStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfFileStateData value)? data,
    TResult? Function(PdfFileStateLoading value)? loading,
    TResult? Function(PdfFileStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfFileStateData value)? data,
    TResult Function(PdfFileStateLoading value)? loading,
    TResult Function(PdfFileStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfFileStateError implements PdfFileState {
  const factory PdfFileStateError(
      final Object error, final StackTrace stackTrace) = _$PdfFileStateError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$PdfFileStateErrorCopyWith<_$PdfFileStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
