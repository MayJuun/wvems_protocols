// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pdf_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PdfFileTearOff {
  const _$PdfFileTearOff();

// ignore: unused_element
  PdfFileData data(File file) {
    return PdfFileData(
      file,
    );
  }

// ignore: unused_element
  PdfFileLoading loading() {
    return const PdfFileLoading();
  }

// ignore: unused_element
  PdfFileError error(Object error, StackTrace stackTrace) {
    return PdfFileError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PdfFile = _$PdfFileTearOff();

/// @nodoc
mixin _$PdfFile {
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
    @required TResult data(PdfFileData value),
    @required TResult loading(PdfFileLoading value),
    @required TResult error(PdfFileError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileData value),
    TResult loading(PdfFileLoading value),
    TResult error(PdfFileError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PdfFileCopyWith<$Res> {
  factory $PdfFileCopyWith(PdfFile value, $Res Function(PdfFile) then) =
      _$PdfFileCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfFileCopyWithImpl<$Res> implements $PdfFileCopyWith<$Res> {
  _$PdfFileCopyWithImpl(this._value, this._then);

  final PdfFile _value;
  // ignore: unused_field
  final $Res Function(PdfFile) _then;
}

/// @nodoc
abstract class $PdfFileDataCopyWith<$Res> {
  factory $PdfFileDataCopyWith(
          PdfFileData value, $Res Function(PdfFileData) then) =
      _$PdfFileDataCopyWithImpl<$Res>;
  $Res call({File file});
}

/// @nodoc
class _$PdfFileDataCopyWithImpl<$Res> extends _$PdfFileCopyWithImpl<$Res>
    implements $PdfFileDataCopyWith<$Res> {
  _$PdfFileDataCopyWithImpl(
      PdfFileData _value, $Res Function(PdfFileData) _then)
      : super(_value, (v) => _then(v as PdfFileData));

  @override
  PdfFileData get _value => super._value as PdfFileData;

  @override
  $Res call({
    Object file = freezed,
  }) {
    return _then(PdfFileData(
      file == freezed ? _value.file : file as File,
    ));
  }
}

/// @nodoc
class _$PdfFileData implements PdfFileData {
  const _$PdfFileData(this.file) : assert(file != null);

  @override
  final File file;

  @override
  String toString() {
    return 'PdfFile.data(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfFileData &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @JsonKey(ignore: true)
  @override
  $PdfFileDataCopyWith<PdfFileData> get copyWith =>
      _$PdfFileDataCopyWithImpl<PdfFileData>(this, _$identity);

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
    @required TResult data(PdfFileData value),
    @required TResult loading(PdfFileLoading value),
    @required TResult error(PdfFileError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileData value),
    TResult loading(PdfFileLoading value),
    TResult error(PdfFileError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfFileData implements PdfFile {
  const factory PdfFileData(File file) = _$PdfFileData;

  File get file;
  @JsonKey(ignore: true)
  $PdfFileDataCopyWith<PdfFileData> get copyWith;
}

/// @nodoc
abstract class $PdfFileLoadingCopyWith<$Res> {
  factory $PdfFileLoadingCopyWith(
          PdfFileLoading value, $Res Function(PdfFileLoading) then) =
      _$PdfFileLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfFileLoadingCopyWithImpl<$Res> extends _$PdfFileCopyWithImpl<$Res>
    implements $PdfFileLoadingCopyWith<$Res> {
  _$PdfFileLoadingCopyWithImpl(
      PdfFileLoading _value, $Res Function(PdfFileLoading) _then)
      : super(_value, (v) => _then(v as PdfFileLoading));

  @override
  PdfFileLoading get _value => super._value as PdfFileLoading;
}

/// @nodoc
class _$PdfFileLoading implements PdfFileLoading {
  const _$PdfFileLoading();

  @override
  String toString() {
    return 'PdfFile.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PdfFileLoading);
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
    @required TResult data(PdfFileData value),
    @required TResult loading(PdfFileLoading value),
    @required TResult error(PdfFileError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileData value),
    TResult loading(PdfFileLoading value),
    TResult error(PdfFileError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfFileLoading implements PdfFile {
  const factory PdfFileLoading() = _$PdfFileLoading;
}

/// @nodoc
abstract class $PdfFileErrorCopyWith<$Res> {
  factory $PdfFileErrorCopyWith(
          PdfFileError value, $Res Function(PdfFileError) then) =
      _$PdfFileErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$PdfFileErrorCopyWithImpl<$Res> extends _$PdfFileCopyWithImpl<$Res>
    implements $PdfFileErrorCopyWith<$Res> {
  _$PdfFileErrorCopyWithImpl(
      PdfFileError _value, $Res Function(PdfFileError) _then)
      : super(_value, (v) => _then(v as PdfFileError));

  @override
  PdfFileError get _value => super._value as PdfFileError;

  @override
  $Res call({
    Object error = freezed,
    Object stackTrace = freezed,
  }) {
    return _then(PdfFileError(
      error == freezed ? _value.error : error,
      stackTrace == freezed ? _value.stackTrace : stackTrace as StackTrace,
    ));
  }
}

/// @nodoc
class _$PdfFileError implements PdfFileError {
  const _$PdfFileError(this.error, this.stackTrace)
      : assert(error != null),
        assert(stackTrace != null);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PdfFile.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfFileError &&
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
  $PdfFileErrorCopyWith<PdfFileError> get copyWith =>
      _$PdfFileErrorCopyWithImpl<PdfFileError>(this, _$identity);

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
    @required TResult data(PdfFileData value),
    @required TResult loading(PdfFileLoading value),
    @required TResult error(PdfFileError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfFileData value),
    TResult loading(PdfFileLoading value),
    TResult error(PdfFileError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfFileError implements PdfFile {
  const factory PdfFileError(Object error, StackTrace stackTrace) =
      _$PdfFileError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  $PdfFileErrorCopyWith<PdfFileError> get copyWith;
}
