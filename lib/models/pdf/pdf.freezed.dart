// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pdf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PdfTearOff {
  const _$PdfTearOff();

// ignore: unused_element
  PdfData data(File file) {
    return PdfData(
      file,
    );
  }

// ignore: unused_element
  PdfLoading loading() {
    return const PdfLoading();
  }

// ignore: unused_element
  PdfError error(Object error, StackTrace stackTrace) {
    return PdfError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Pdf = _$PdfTearOff();

/// @nodoc
mixin _$Pdf {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(File file),
    @required TResult loading(),
    @required TResult error(Object error, StackTrace stackTrace),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(File file),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(PdfData value),
    @required TResult loading(PdfLoading value),
    @required TResult error(PdfError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfData value),
    TResult loading(PdfLoading value),
    TResult error(PdfError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PdfCopyWith<$Res> {
  factory $PdfCopyWith(Pdf value, $Res Function(Pdf) then) =
      _$PdfCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfCopyWithImpl<$Res> implements $PdfCopyWith<$Res> {
  _$PdfCopyWithImpl(this._value, this._then);

  final Pdf _value;
  // ignore: unused_field
  final $Res Function(Pdf) _then;
}

/// @nodoc
abstract class $PdfDataCopyWith<$Res> {
  factory $PdfDataCopyWith(PdfData value, $Res Function(PdfData) then) =
      _$PdfDataCopyWithImpl<$Res>;
  $Res call({File file});
}

/// @nodoc
class _$PdfDataCopyWithImpl<$Res> extends _$PdfCopyWithImpl<$Res>
    implements $PdfDataCopyWith<$Res> {
  _$PdfDataCopyWithImpl(PdfData _value, $Res Function(PdfData) _then)
      : super(_value, (v) => _then(v as PdfData));

  @override
  PdfData get _value => super._value as PdfData;

  @override
  $Res call({
    Object file = freezed,
  }) {
    return _then(PdfData(
      file == freezed ? _value.file : file as File,
    ));
  }
}

/// @nodoc
class _$PdfData implements PdfData {
  const _$PdfData(this.file) : assert(file != null);

  @override
  final File file;

  @override
  String toString() {
    return 'Pdf.data(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfData &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @JsonKey(ignore: true)
  @override
  $PdfDataCopyWith<PdfData> get copyWith =>
      _$PdfDataCopyWithImpl<PdfData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(File file),
    @required TResult loading(),
    @required TResult error(Object error, StackTrace stackTrace),
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
    @required TResult orElse(),
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
    @required TResult data(PdfData value),
    @required TResult loading(PdfLoading value),
    @required TResult error(PdfError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfData value),
    TResult loading(PdfLoading value),
    TResult error(PdfError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfData implements Pdf {
  const factory PdfData(File file) = _$PdfData;

  File get file;
  @JsonKey(ignore: true)
  $PdfDataCopyWith<PdfData> get copyWith;
}

/// @nodoc
abstract class $PdfLoadingCopyWith<$Res> {
  factory $PdfLoadingCopyWith(
          PdfLoading value, $Res Function(PdfLoading) then) =
      _$PdfLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfLoadingCopyWithImpl<$Res> extends _$PdfCopyWithImpl<$Res>
    implements $PdfLoadingCopyWith<$Res> {
  _$PdfLoadingCopyWithImpl(PdfLoading _value, $Res Function(PdfLoading) _then)
      : super(_value, (v) => _then(v as PdfLoading));

  @override
  PdfLoading get _value => super._value as PdfLoading;
}

/// @nodoc
class _$PdfLoading implements PdfLoading {
  const _$PdfLoading();

  @override
  String toString() {
    return 'Pdf.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PdfLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(File file),
    @required TResult loading(),
    @required TResult error(Object error, StackTrace stackTrace),
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
    @required TResult orElse(),
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
    @required TResult data(PdfData value),
    @required TResult loading(PdfLoading value),
    @required TResult error(PdfError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfData value),
    TResult loading(PdfLoading value),
    TResult error(PdfError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfLoading implements Pdf {
  const factory PdfLoading() = _$PdfLoading;
}

/// @nodoc
abstract class $PdfErrorCopyWith<$Res> {
  factory $PdfErrorCopyWith(PdfError value, $Res Function(PdfError) then) =
      _$PdfErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$PdfErrorCopyWithImpl<$Res> extends _$PdfCopyWithImpl<$Res>
    implements $PdfErrorCopyWith<$Res> {
  _$PdfErrorCopyWithImpl(PdfError _value, $Res Function(PdfError) _then)
      : super(_value, (v) => _then(v as PdfError));

  @override
  PdfError get _value => super._value as PdfError;

  @override
  $Res call({
    Object error = freezed,
    Object stackTrace = freezed,
  }) {
    return _then(PdfError(
      error == freezed ? _value.error : error,
      stackTrace == freezed ? _value.stackTrace : stackTrace as StackTrace,
    ));
  }
}

/// @nodoc
class _$PdfError implements PdfError {
  const _$PdfError(this.error, this.stackTrace)
      : assert(error != null),
        assert(stackTrace != null);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'Pdf.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfError &&
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
  $PdfErrorCopyWith<PdfError> get copyWith =>
      _$PdfErrorCopyWithImpl<PdfError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(File file),
    @required TResult loading(),
    @required TResult error(Object error, StackTrace stackTrace),
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
    @required TResult orElse(),
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
    @required TResult data(PdfData value),
    @required TResult loading(PdfLoading value),
    @required TResult error(PdfError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfData value),
    TResult loading(PdfLoading value),
    TResult error(PdfError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfError implements Pdf {
  const factory PdfError(Object error, StackTrace stackTrace) = _$PdfError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  $PdfErrorCopyWith<PdfError> get copyWith;
}
