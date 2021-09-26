// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pdf_text_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PdfTextListStateTearOff {
  const _$PdfTextListStateTearOff();

  PdfTextListStateData data(Map<String, dynamic> textList) {
    return PdfTextListStateData(
      textList,
    );
  }

  PdfTextListStateLoading loading() {
    return const PdfTextListStateLoading();
  }

  PdfTextListStateError error(Object error, StackTrace stackTrace) {
    return PdfTextListStateError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $PdfTextListState = _$PdfTextListStateTearOff();

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
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
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
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
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
    Object? textList = freezed,
  }) {
    return _then(PdfTextListStateData(
      textList == freezed
          ? _value.textList
          : textList // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$PdfTextListStateData implements PdfTextListStateData {
  const _$PdfTextListStateData(this.textList);

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
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
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
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
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
  const factory PdfTextListStateData(Map<String, dynamic> textList) =
      _$PdfTextListStateData;

  Map<String, dynamic> get textList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfTextListStateDataCopyWith<PdfTextListStateData> get copyWith =>
      throw _privateConstructorUsedError;
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
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
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
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
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
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(PdfTextListStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace == freezed
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
    TResult Function(Map<String, dynamic> textList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
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
    TResult Function(PdfTextListStateData value)? data,
    TResult Function(PdfTextListStateLoading value)? loading,
    TResult Function(PdfTextListStateError value)? error,
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
  const factory PdfTextListStateError(Object error, StackTrace stackTrace) =
      _$PdfTextListStateError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfTextListStateErrorCopyWith<PdfTextListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
