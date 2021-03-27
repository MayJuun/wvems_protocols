// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pdf_text_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PdfTextListStateTearOff {
  const _$PdfTextListStateTearOff();

// ignore: unused_element
  PdfTextListStateData data(Map<String, dynamic> textList) {
    return PdfTextListStateData(
      textList,
    );
  }

// ignore: unused_element
  PdfTextListStateLoading loading() {
    return const PdfTextListStateLoading();
  }

// ignore: unused_element
  PdfTextListStateError error(Object error, StackTrace stackTrace) {
    return PdfTextListStateError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PdfTextListState = _$PdfTextListStateTearOff();

/// @nodoc
mixin _$PdfTextListState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(Map<String, dynamic> textList),
    required TResult loading(),
    required TResult error(Object error, StackTrace stackTrace),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Map<String, dynamic> textList),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    required TResult data(PdfTextListStateData value),
    required TResult loading(PdfTextListStateLoading value),
    required TResult error(PdfTextListStateError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfTextListStateData value),
    TResult loading(PdfTextListStateLoading value),
    TResult error(PdfTextListStateError value),
    required TResult orElse(),
  });
}

/// @nodoc
abstract class $PdfTextListStateCopyWith<$Res> {
  factory $PdfTextListStateCopyWith(
          PdfTextListState value, $Res Function(PdfTextListState) then) =
      _$PdfTextListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfTextListStateCopyWithImpl<$Res>
    implements $PdfTextListStateCopyWith<$Res> {
  _$PdfTextListStateCopyWithImpl(this._value, this._then);

  final PdfTextListState _value;
  // ignore: unused_field
  final $Res Function(PdfTextListState) _then;
}

/// @nodoc
abstract class $PdfTextListStateDataCopyWith<$Res> {
  factory $PdfTextListStateDataCopyWith(PdfTextListStateData value,
          $Res Function(PdfTextListStateData) then) =
      _$PdfTextListStateDataCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> textList});
}

/// @nodoc
class _$PdfTextListStateDataCopyWithImpl<$Res>
    extends _$PdfTextListStateCopyWithImpl<$Res>
    implements $PdfTextListStateDataCopyWith<$Res> {
  _$PdfTextListStateDataCopyWithImpl(
      PdfTextListStateData _value, $Res Function(PdfTextListStateData) _then)
      : super(_value, (v) => _then(v as PdfTextListStateData));

  @override
  PdfTextListStateData get _value => super._value as PdfTextListStateData;

  @override
  $Res call({
    Object textList = freezed,
  }) {
    return _then(PdfTextListStateData(
      textList == freezed ? _value.textList : textList as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$PdfTextListStateData implements PdfTextListStateData {
  const _$PdfTextListStateData(this.textList) : assert(textList != null);

  @override
  final Map<String, dynamic> textList;

  @override
  String toString() {
    return 'PdfTextListState.data(textList: $textList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfTextListStateData &&
            (identical(other.textList, textList) ||
                const DeepCollectionEquality()
                    .equals(other.textList, textList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(textList);

  @JsonKey(ignore: true)
  @override
  $PdfTextListStateDataCopyWith<PdfTextListStateData> get copyWith =>
      _$PdfTextListStateDataCopyWithImpl<PdfTextListStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(Map<String, dynamic> textList),
    required TResult loading(),
    required TResult error(Object error, StackTrace stackTrace),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(textList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult data(Map<String, dynamic> textList),
    TResult loading(),
    TResult error(Object error, StackTrace stackTrace),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(textList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    required TResult data(PdfTextListStateData value),
    required TResult loading(PdfTextListStateLoading value),
    required TResult error(PdfTextListStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfTextListStateData value),
    TResult loading(PdfTextListStateLoading value),
    TResult error(PdfTextListStateError value),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfTextListStateData implements PdfTextListState {
  const factory PdfTextListStateData(Map<String, dynamic> textList) =
      _$PdfTextListStateData;

  Map<String, dynamic> get textList;
  @JsonKey(ignore: true)
  $PdfTextListStateDataCopyWith<PdfTextListStateData> get copyWith;
}

/// @nodoc
abstract class $PdfTextListStateLoadingCopyWith<$Res> {
  factory $PdfTextListStateLoadingCopyWith(PdfTextListStateLoading value,
          $Res Function(PdfTextListStateLoading) then) =
      _$PdfTextListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfTextListStateLoadingCopyWithImpl<$Res>
    extends _$PdfTextListStateCopyWithImpl<$Res>
    implements $PdfTextListStateLoadingCopyWith<$Res> {
  _$PdfTextListStateLoadingCopyWithImpl(PdfTextListStateLoading _value,
      $Res Function(PdfTextListStateLoading) _then)
      : super(_value, (v) => _then(v as PdfTextListStateLoading));

  @override
  PdfTextListStateLoading get _value => super._value as PdfTextListStateLoading;
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
    return identical(this, other) || (other is PdfTextListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(Map<String, dynamic> textList),
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
    TResult data(Map<String, dynamic> textList),
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
    required TResult data(PdfTextListStateData value),
    required TResult loading(PdfTextListStateLoading value),
    required TResult error(PdfTextListStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfTextListStateData value),
    TResult loading(PdfTextListStateLoading value),
    TResult error(PdfTextListStateError value),
    required TResult orElse(),
  }) {
    assert(orElse != null);
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
abstract class $PdfTextListStateErrorCopyWith<$Res> {
  factory $PdfTextListStateErrorCopyWith(PdfTextListStateError value,
          $Res Function(PdfTextListStateError) then) =
      _$PdfTextListStateErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$PdfTextListStateErrorCopyWithImpl<$Res>
    extends _$PdfTextListStateCopyWithImpl<$Res>
    implements $PdfTextListStateErrorCopyWith<$Res> {
  _$PdfTextListStateErrorCopyWithImpl(
      PdfTextListStateError _value, $Res Function(PdfTextListStateError) _then)
      : super(_value, (v) => _then(v as PdfTextListStateError));

  @override
  PdfTextListStateError get _value => super._value as PdfTextListStateError;

  @override
  $Res call({
    Object error = freezed,
    Object stackTrace = freezed,
  }) {
    return _then(PdfTextListStateError(
      error == freezed ? _value.error : error,
      stackTrace == freezed ? _value.stackTrace : stackTrace as StackTrace,
    ));
  }
}

/// @nodoc
class _$PdfTextListStateError implements PdfTextListStateError {
  const _$PdfTextListStateError(this.error, this.stackTrace)
      : assert(error != null),
        assert(stackTrace != null);

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
        (other is PdfTextListStateError &&
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
  $PdfTextListStateErrorCopyWith<PdfTextListStateError> get copyWith =>
      _$PdfTextListStateErrorCopyWithImpl<PdfTextListStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    required TResult data(Map<String, dynamic> textList),
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
    TResult data(Map<String, dynamic> textList),
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
    required TResult data(PdfTextListStateData value),
    required TResult loading(PdfTextListStateLoading value),
    required TResult error(PdfTextListStateError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult data(PdfTextListStateData value),
    TResult loading(PdfTextListStateLoading value),
    TResult error(PdfTextListStateError value),
    required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfTextListStateError implements PdfTextListState {
  const factory PdfTextListStateError(Object error, StackTrace stackTrace) =
      _$PdfTextListStateError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  $PdfTextListStateErrorCopyWith<PdfTextListStateError> get copyWith;
}
