// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pdf_doc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PdfDocStateTearOff {
  const _$PdfDocStateTearOff();

// ignore: unused_element
  PdfDocStateData data(PDFDoc pdfDoc) {
    return PdfDocStateData(
      pdfDoc,
    );
  }

// ignore: unused_element
  PdfDocStateLoading loading() {
    return const PdfDocStateLoading();
  }

// ignore: unused_element
  PdfDocStateError error(Object error, StackTrace stackTrace) {
    return PdfDocStateError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PdfDocState = _$PdfDocStateTearOff();

/// @nodoc
mixin _$PdfDocState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(PDFDoc pdfDoc),
    @required TResult loading(),
    @required TResult error(Object error, StackTrace stackTrace),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(PDFDoc pdfDoc),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(PdfDocStateData value),
    @required TResult loading(PdfDocStateLoading value),
    @required TResult error(PdfDocStateError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfDocStateData value),
    TResult loading(PdfDocStateLoading value),
    TResult error(PdfDocStateError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PdfDocStateCopyWith<$Res> {
  factory $PdfDocStateCopyWith(
          PdfDocState value, $Res Function(PdfDocState) then) =
      _$PdfDocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfDocStateCopyWithImpl<$Res> implements $PdfDocStateCopyWith<$Res> {
  _$PdfDocStateCopyWithImpl(this._value, this._then);

  final PdfDocState _value;
  // ignore: unused_field
  final $Res Function(PdfDocState) _then;
}

/// @nodoc
abstract class $PdfDocStateDataCopyWith<$Res> {
  factory $PdfDocStateDataCopyWith(
          PdfDocStateData value, $Res Function(PdfDocStateData) then) =
      _$PdfDocStateDataCopyWithImpl<$Res>;
  $Res call({PDFDoc pdfDoc});
}

/// @nodoc
class _$PdfDocStateDataCopyWithImpl<$Res>
    extends _$PdfDocStateCopyWithImpl<$Res>
    implements $PdfDocStateDataCopyWith<$Res> {
  _$PdfDocStateDataCopyWithImpl(
      PdfDocStateData _value, $Res Function(PdfDocStateData) _then)
      : super(_value, (v) => _then(v as PdfDocStateData));

  @override
  PdfDocStateData get _value => super._value as PdfDocStateData;

  @override
  $Res call({
    Object pdfDoc = freezed,
  }) {
    return _then(PdfDocStateData(
      pdfDoc == freezed ? _value.pdfDoc : pdfDoc as PDFDoc,
    ));
  }
}

/// @nodoc
class _$PdfDocStateData implements PdfDocStateData {
  const _$PdfDocStateData(this.pdfDoc) : assert(pdfDoc != null);

  @override
  final PDFDoc pdfDoc;

  @override
  String toString() {
    return 'PdfDocState.data(pdfDoc: $pdfDoc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfDocStateData &&
            (identical(other.pdfDoc, pdfDoc) ||
                const DeepCollectionEquality().equals(other.pdfDoc, pdfDoc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pdfDoc);

  @JsonKey(ignore: true)
  @override
  $PdfDocStateDataCopyWith<PdfDocStateData> get copyWith =>
      _$PdfDocStateDataCopyWithImpl<PdfDocStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(PDFDoc pdfDoc),
    @required TResult loading(),
    @required TResult error(Object error, StackTrace stackTrace),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(pdfDoc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(PDFDoc pdfDoc),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(pdfDoc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult data(PdfDocStateData value),
    @required TResult loading(PdfDocStateLoading value),
    @required TResult error(PdfDocStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfDocStateData value),
    TResult loading(PdfDocStateLoading value),
    TResult error(PdfDocStateError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfDocStateData implements PdfDocState {
  const factory PdfDocStateData(PDFDoc pdfDoc) = _$PdfDocStateData;

  PDFDoc get pdfDoc;
  @JsonKey(ignore: true)
  $PdfDocStateDataCopyWith<PdfDocStateData> get copyWith;
}

/// @nodoc
abstract class $PdfDocStateLoadingCopyWith<$Res> {
  factory $PdfDocStateLoadingCopyWith(
          PdfDocStateLoading value, $Res Function(PdfDocStateLoading) then) =
      _$PdfDocStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfDocStateLoadingCopyWithImpl<$Res>
    extends _$PdfDocStateCopyWithImpl<$Res>
    implements $PdfDocStateLoadingCopyWith<$Res> {
  _$PdfDocStateLoadingCopyWithImpl(
      PdfDocStateLoading _value, $Res Function(PdfDocStateLoading) _then)
      : super(_value, (v) => _then(v as PdfDocStateLoading));

  @override
  PdfDocStateLoading get _value => super._value as PdfDocStateLoading;
}

/// @nodoc
class _$PdfDocStateLoading implements PdfDocStateLoading {
  const _$PdfDocStateLoading();

  @override
  String toString() {
    return 'PdfDocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PdfDocStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(PDFDoc pdfDoc),
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
    TResult data(PDFDoc pdfDoc),
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
    @required TResult data(PdfDocStateData value),
    @required TResult loading(PdfDocStateLoading value),
    @required TResult error(PdfDocStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfDocStateData value),
    TResult loading(PdfDocStateLoading value),
    TResult error(PdfDocStateError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfDocStateLoading implements PdfDocState {
  const factory PdfDocStateLoading() = _$PdfDocStateLoading;
}

/// @nodoc
abstract class $PdfDocStateErrorCopyWith<$Res> {
  factory $PdfDocStateErrorCopyWith(
          PdfDocStateError value, $Res Function(PdfDocStateError) then) =
      _$PdfDocStateErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$PdfDocStateErrorCopyWithImpl<$Res>
    extends _$PdfDocStateCopyWithImpl<$Res>
    implements $PdfDocStateErrorCopyWith<$Res> {
  _$PdfDocStateErrorCopyWithImpl(
      PdfDocStateError _value, $Res Function(PdfDocStateError) _then)
      : super(_value, (v) => _then(v as PdfDocStateError));

  @override
  PdfDocStateError get _value => super._value as PdfDocStateError;

  @override
  $Res call({
    Object error = freezed,
    Object stackTrace = freezed,
  }) {
    return _then(PdfDocStateError(
      error == freezed ? _value.error : error,
      stackTrace == freezed ? _value.stackTrace : stackTrace as StackTrace,
    ));
  }
}

/// @nodoc
class _$PdfDocStateError implements PdfDocStateError {
  const _$PdfDocStateError(this.error, this.stackTrace)
      : assert(error != null),
        assert(stackTrace != null);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PdfDocState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfDocStateError &&
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
  $PdfDocStateErrorCopyWith<PdfDocStateError> get copyWith =>
      _$PdfDocStateErrorCopyWithImpl<PdfDocStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult data(PDFDoc pdfDoc),
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
    TResult data(PDFDoc pdfDoc),
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
    @required TResult data(PdfDocStateData value),
    @required TResult loading(PdfDocStateLoading value),
    @required TResult error(PdfDocStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfDocStateData value),
    TResult loading(PdfDocStateLoading value),
    TResult error(PdfDocStateError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfDocStateError implements PdfDocState {
  const factory PdfDocStateError(Object error, StackTrace stackTrace) =
      _$PdfDocStateError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  $PdfDocStateErrorCopyWith<PdfDocStateError> get copyWith;
}
