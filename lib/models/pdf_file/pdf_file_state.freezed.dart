// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pdf_file_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PdfFileStateTearOff {
  const _$PdfFileStateTearOff();

// ignore: unused_element
  PdfFileStateData data(File file) {
    return PdfFileStateData(
      file,
    );
  }

// ignore: unused_element
  PdfFileStateLoading loading() {
    return const PdfFileStateLoading();
  }

// ignore: unused_element
  PdfFileStateError error(Object error, StackTrace stackTrace) {
    return PdfFileStateError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PdfFileState = _$PdfFileStateTearOff();

/// @nodoc
mixin _$PdfFileState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(File file),
    required TResult loading(),
    required TResult error(Object error, StackTrace stackTrace),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(File file),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    required TResult data(PdfFileStateData value),
    required TResult loading(PdfFileStateLoading value),
    required TResult error(PdfFileStateError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileStateData value),
    TResult loading(PdfFileStateLoading value),
    TResult error(PdfFileStateError value),
    required TResult orElse(),
  });
}

/// @nodoc
abstract class $PdfFileStateCopyWith<$Res> {
  factory $PdfFileStateCopyWith(
          PdfFileState value, $Res Function(PdfFileState) then) =
      _$PdfFileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfFileStateCopyWithImpl<$Res> implements $PdfFileStateCopyWith<$Res> {
  _$PdfFileStateCopyWithImpl(this._value, this._then);

  final PdfFileState _value;
  // ignore: unused_field
  final $Res Function(PdfFileState) _then;
}

/// @nodoc
abstract class $PdfFileStateDataCopyWith<$Res> {
  factory $PdfFileStateDataCopyWith(
          PdfFileStateData value, $Res Function(PdfFileStateData) then) =
      _$PdfFileStateDataCopyWithImpl<$Res>;
  $Res call({File file});
}

/// @nodoc
class _$PdfFileStateDataCopyWithImpl<$Res>
    extends _$PdfFileStateCopyWithImpl<$Res>
    implements $PdfFileStateDataCopyWith<$Res> {
  _$PdfFileStateDataCopyWithImpl(
      PdfFileStateData _value, $Res Function(PdfFileStateData) _then)
      : super(_value, (v) => _then(v as PdfFileStateData));

  @override
  PdfFileStateData get _value => super._value as PdfFileStateData;

  @override
  $Res call({
    Object file = freezed,
  }) {
    return _then(PdfFileStateData(
      file == freezed ? _value.file : file as File,
    ));
  }
}

/// @nodoc
class _$PdfFileStateData implements PdfFileStateData {
  const _$PdfFileStateData(this.file) : assert(file != null);

  @override
  final File file;

  @override
  String toString() {
    return 'PdfFileState.data(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfFileStateData &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @JsonKey(ignore: true)
  @override
  $PdfFileStateDataCopyWith<PdfFileStateData> get copyWith =>
      _$PdfFileStateDataCopyWithImpl<PdfFileStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(File file),
    required TResult loading(),
    required TResult error(Object error, StackTrace stackTrace),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(File file),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    required TResult data(PdfFileStateData value),
    required TResult loading(PdfFileStateLoading value),
    required TResult error(PdfFileStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileStateData value),
    TResult loading(PdfFileStateLoading value),
    TResult error(PdfFileStateError value),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfFileStateData implements PdfFileState {
  const factory PdfFileStateData(File file) = _$PdfFileStateData;

  File get file;
  @JsonKey(ignore: true)
  $PdfFileStateDataCopyWith<PdfFileStateData> get copyWith;
}

/// @nodoc
abstract class $PdfFileStateLoadingCopyWith<$Res> {
  factory $PdfFileStateLoadingCopyWith(
          PdfFileStateLoading value, $Res Function(PdfFileStateLoading) then) =
      _$PdfFileStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfFileStateLoadingCopyWithImpl<$Res>
    extends _$PdfFileStateCopyWithImpl<$Res>
    implements $PdfFileStateLoadingCopyWith<$Res> {
  _$PdfFileStateLoadingCopyWithImpl(
      PdfFileStateLoading _value, $Res Function(PdfFileStateLoading) _then)
      : super(_value, (v) => _then(v as PdfFileStateLoading));

  @override
  PdfFileStateLoading get _value => super._value as PdfFileStateLoading;
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
    return identical(this, other) || (other is PdfFileStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(File file),
    required TResult loading(),
    required TResult error(Object error, StackTrace stackTrace),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(File file),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    required TResult data(PdfFileStateData value),
    required TResult loading(PdfFileStateLoading value),
    required TResult error(PdfFileStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileStateData value),
    TResult loading(PdfFileStateLoading value),
    TResult error(PdfFileStateError value),
    required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $PdfFileStateErrorCopyWith<$Res> {
  factory $PdfFileStateErrorCopyWith(
          PdfFileStateError value, $Res Function(PdfFileStateError) then) =
      _$PdfFileStateErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$PdfFileStateErrorCopyWithImpl<$Res>
    extends _$PdfFileStateCopyWithImpl<$Res>
    implements $PdfFileStateErrorCopyWith<$Res> {
  _$PdfFileStateErrorCopyWithImpl(
      PdfFileStateError _value, $Res Function(PdfFileStateError) _then)
      : super(_value, (v) => _then(v as PdfFileStateError));

  @override
  PdfFileStateError get _value => super._value as PdfFileStateError;

  @override
  $Res call({
    Object error = freezed,
    Object stackTrace = freezed,
  }) {
    return _then(PdfFileStateError(
      error == freezed ? _value.error : error,
      stackTrace == freezed ? _value.stackTrace : stackTrace as StackTrace,
    ));
  }
}

/// @nodoc
class _$PdfFileStateError implements PdfFileStateError {
  const _$PdfFileStateError(this.error, this.stackTrace)
      : assert(error != null),
        assert(stackTrace != null);

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
        (other is PdfFileStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.stackTrace, stackTrace) ||
                const DeepCollectionEquality()
                    .equals(other.stackTrace, stackTrace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(stackTrace);

  @JsonKey(ignore: true)
  @override
  $PdfFileStateErrorCopyWith<PdfFileStateError> get copyWith =>
      _$PdfFileStateErrorCopyWithImpl<PdfFileStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(File file),
    required TResult loading(),
    required TResult error(Object error, StackTrace stackTrace),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(File file),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    required TResult data(PdfFileStateData value),
    required TResult loading(PdfFileStateLoading value),
    required TResult error(PdfFileStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileStateData value),
    TResult loading(PdfFileStateLoading value),
    TResult error(PdfFileStateError value),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfFileStateError implements PdfFileState {
  const factory PdfFileStateError(Object error, StackTrace stackTrace) =
      _$PdfFileStateError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  $PdfFileStateErrorCopyWith<PdfFileStateError> get copyWith;
}
