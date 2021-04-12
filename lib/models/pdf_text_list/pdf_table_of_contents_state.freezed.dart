// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pdf_table_of_contents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PdfTableOfContentsStateTearOff {
  const _$PdfTableOfContentsStateTearOff();

  PdfTableOfContentsStateData data(Map<String, dynamic> textList) {
    return PdfTableOfContentsStateData(
      textList,
    );
  }

  PdfTableOfContentsStateLoading loading() {
    return const PdfTableOfContentsStateLoading();
  }

  PdfTableOfContentsStateError error(Object error, StackTrace stackTrace) {
    return PdfTableOfContentsStateError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $PdfTableOfContentsState = _$PdfTableOfContentsStateTearOff();

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
      _$PdfTableOfContentsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfTableOfContentsStateCopyWithImpl<$Res>
    implements $PdfTableOfContentsStateCopyWith<$Res> {
  _$PdfTableOfContentsStateCopyWithImpl(this._value, this._then);

  final PdfTableOfContentsState _value;
  // ignore: unused_field
  final $Res Function(PdfTableOfContentsState) _then;
}

/// @nodoc
abstract class $PdfTableOfContentsStateDataCopyWith<$Res> {
  factory $PdfTableOfContentsStateDataCopyWith(
          PdfTableOfContentsStateData value,
          $Res Function(PdfTableOfContentsStateData) then) =
      _$PdfTableOfContentsStateDataCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> textList});
}

/// @nodoc
class _$PdfTableOfContentsStateDataCopyWithImpl<$Res>
    extends _$PdfTableOfContentsStateCopyWithImpl<$Res>
    implements $PdfTableOfContentsStateDataCopyWith<$Res> {
  _$PdfTableOfContentsStateDataCopyWithImpl(PdfTableOfContentsStateData _value,
      $Res Function(PdfTableOfContentsStateData) _then)
      : super(_value, (v) => _then(v as PdfTableOfContentsStateData));

  @override
  PdfTableOfContentsStateData get _value =>
      super._value as PdfTableOfContentsStateData;

  @override
  $Res call({
    Object? textList = freezed,
  }) {
    return _then(PdfTableOfContentsStateData(
      textList == freezed
          ? _value.textList
          : textList // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
class _$PdfTableOfContentsStateData implements PdfTableOfContentsStateData {
  const _$PdfTableOfContentsStateData(this.textList);

  @override
  final Map<String, dynamic> textList;

  @override
  String toString() {
    return 'PdfTableOfContentsState.data(textList: $textList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfTableOfContentsStateData &&
            (identical(other.textList, textList) ||
                const DeepCollectionEquality()
                    .equals(other.textList, textList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(textList);

  @JsonKey(ignore: true)
  @override
  $PdfTableOfContentsStateDataCopyWith<PdfTableOfContentsStateData>
      get copyWith => _$PdfTableOfContentsStateDataCopyWithImpl<
          PdfTableOfContentsStateData>(this, _$identity);

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
  const factory PdfTableOfContentsStateData(Map<String, dynamic> textList) =
      _$PdfTableOfContentsStateData;

  Map<String, dynamic> get textList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfTableOfContentsStateDataCopyWith<PdfTableOfContentsStateData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfTableOfContentsStateLoadingCopyWith<$Res> {
  factory $PdfTableOfContentsStateLoadingCopyWith(
          PdfTableOfContentsStateLoading value,
          $Res Function(PdfTableOfContentsStateLoading) then) =
      _$PdfTableOfContentsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfTableOfContentsStateLoadingCopyWithImpl<$Res>
    extends _$PdfTableOfContentsStateCopyWithImpl<$Res>
    implements $PdfTableOfContentsStateLoadingCopyWith<$Res> {
  _$PdfTableOfContentsStateLoadingCopyWithImpl(
      PdfTableOfContentsStateLoading _value,
      $Res Function(PdfTableOfContentsStateLoading) _then)
      : super(_value, (v) => _then(v as PdfTableOfContentsStateLoading));

  @override
  PdfTableOfContentsStateLoading get _value =>
      super._value as PdfTableOfContentsStateLoading;
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
    return identical(this, other) || (other is PdfTableOfContentsStateLoading);
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
abstract class $PdfTableOfContentsStateErrorCopyWith<$Res> {
  factory $PdfTableOfContentsStateErrorCopyWith(
          PdfTableOfContentsStateError value,
          $Res Function(PdfTableOfContentsStateError) then) =
      _$PdfTableOfContentsStateErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$PdfTableOfContentsStateErrorCopyWithImpl<$Res>
    extends _$PdfTableOfContentsStateCopyWithImpl<$Res>
    implements $PdfTableOfContentsStateErrorCopyWith<$Res> {
  _$PdfTableOfContentsStateErrorCopyWithImpl(
      PdfTableOfContentsStateError _value,
      $Res Function(PdfTableOfContentsStateError) _then)
      : super(_value, (v) => _then(v as PdfTableOfContentsStateError));

  @override
  PdfTableOfContentsStateError get _value =>
      super._value as PdfTableOfContentsStateError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(PdfTableOfContentsStateError(
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
        (other is PdfTableOfContentsStateError &&
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
  $PdfTableOfContentsStateErrorCopyWith<PdfTableOfContentsStateError>
      get copyWith => _$PdfTableOfContentsStateErrorCopyWithImpl<
          PdfTableOfContentsStateError>(this, _$identity);

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
      Object error, StackTrace stackTrace) = _$PdfTableOfContentsStateError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfTableOfContentsStateErrorCopyWith<PdfTableOfContentsStateError>
      get copyWith => throw _privateConstructorUsedError;
}
