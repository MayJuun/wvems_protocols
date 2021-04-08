// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pdf_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PdfSearchStateTearOff {
  const _$PdfSearchStateTearOff();

  PdfSearchStateData data(
      Map<String, List<PdfSearchStrings>> searchStringDataMap) {
    return PdfSearchStateData(
      searchStringDataMap,
    );
  }

  PdfSearchStateHistory history(
      List<PdfSearchStrings> searchStringHistoryList) {
    return PdfSearchStateHistory(
      searchStringHistoryList,
    );
  }

  PdfSearchStateLoading loading() {
    return const PdfSearchStateLoading();
  }

  PdfSearchStateError error(Object error, StackTrace stackTrace) {
    return PdfSearchStateError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $PdfSearchState = _$PdfSearchStateTearOff();

/// @nodoc
mixin _$PdfSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(List<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(List<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfSearchStateData value) data,
    required TResult Function(PdfSearchStateHistory value) history,
    required TResult Function(PdfSearchStateLoading value) loading,
    required TResult Function(PdfSearchStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfSearchStateData value)? data,
    TResult Function(PdfSearchStateHistory value)? history,
    TResult Function(PdfSearchStateLoading value)? loading,
    TResult Function(PdfSearchStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfSearchStateCopyWith<$Res> {
  factory $PdfSearchStateCopyWith(
          PdfSearchState value, $Res Function(PdfSearchState) then) =
      _$PdfSearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfSearchStateCopyWithImpl<$Res>
    implements $PdfSearchStateCopyWith<$Res> {
  _$PdfSearchStateCopyWithImpl(this._value, this._then);

  final PdfSearchState _value;
  // ignore: unused_field
  final $Res Function(PdfSearchState) _then;
}

/// @nodoc
abstract class $PdfSearchStateDataCopyWith<$Res> {
  factory $PdfSearchStateDataCopyWith(
          PdfSearchStateData value, $Res Function(PdfSearchStateData) then) =
      _$PdfSearchStateDataCopyWithImpl<$Res>;
  $Res call({Map<String, List<PdfSearchStrings>> searchStringDataMap});
}

/// @nodoc
class _$PdfSearchStateDataCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res>
    implements $PdfSearchStateDataCopyWith<$Res> {
  _$PdfSearchStateDataCopyWithImpl(
      PdfSearchStateData _value, $Res Function(PdfSearchStateData) _then)
      : super(_value, (v) => _then(v as PdfSearchStateData));

  @override
  PdfSearchStateData get _value => super._value as PdfSearchStateData;

  @override
  $Res call({
    Object? searchStringDataMap = freezed,
  }) {
    return _then(PdfSearchStateData(
      searchStringDataMap == freezed
          ? _value.searchStringDataMap
          : searchStringDataMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<PdfSearchStrings>>,
    ));
  }
}

/// @nodoc
class _$PdfSearchStateData implements PdfSearchStateData {
  const _$PdfSearchStateData(this.searchStringDataMap);

  @override
  final Map<String, List<PdfSearchStrings>> searchStringDataMap;

  @override
  String toString() {
    return 'PdfSearchState.data(searchStringDataMap: $searchStringDataMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfSearchStateData &&
            (identical(other.searchStringDataMap, searchStringDataMap) ||
                const DeepCollectionEquality()
                    .equals(other.searchStringDataMap, searchStringDataMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchStringDataMap);

  @JsonKey(ignore: true)
  @override
  $PdfSearchStateDataCopyWith<PdfSearchStateData> get copyWith =>
      _$PdfSearchStateDataCopyWithImpl<PdfSearchStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(List<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return data(searchStringDataMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(List<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(searchStringDataMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfSearchStateData value) data,
    required TResult Function(PdfSearchStateHistory value) history,
    required TResult Function(PdfSearchStateLoading value) loading,
    required TResult Function(PdfSearchStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfSearchStateData value)? data,
    TResult Function(PdfSearchStateHistory value)? history,
    TResult Function(PdfSearchStateLoading value)? loading,
    TResult Function(PdfSearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class PdfSearchStateData implements PdfSearchState {
  const factory PdfSearchStateData(
          Map<String, List<PdfSearchStrings>> searchStringDataMap) =
      _$PdfSearchStateData;

  Map<String, List<PdfSearchStrings>> get searchStringDataMap =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfSearchStateDataCopyWith<PdfSearchStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfSearchStateHistoryCopyWith<$Res> {
  factory $PdfSearchStateHistoryCopyWith(PdfSearchStateHistory value,
          $Res Function(PdfSearchStateHistory) then) =
      _$PdfSearchStateHistoryCopyWithImpl<$Res>;
  $Res call({List<PdfSearchStrings> searchStringHistoryList});
}

/// @nodoc
class _$PdfSearchStateHistoryCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res>
    implements $PdfSearchStateHistoryCopyWith<$Res> {
  _$PdfSearchStateHistoryCopyWithImpl(
      PdfSearchStateHistory _value, $Res Function(PdfSearchStateHistory) _then)
      : super(_value, (v) => _then(v as PdfSearchStateHistory));

  @override
  PdfSearchStateHistory get _value => super._value as PdfSearchStateHistory;

  @override
  $Res call({
    Object? searchStringHistoryList = freezed,
  }) {
    return _then(PdfSearchStateHistory(
      searchStringHistoryList == freezed
          ? _value.searchStringHistoryList
          : searchStringHistoryList // ignore: cast_nullable_to_non_nullable
              as List<PdfSearchStrings>,
    ));
  }
}

/// @nodoc
class _$PdfSearchStateHistory implements PdfSearchStateHistory {
  const _$PdfSearchStateHistory(this.searchStringHistoryList);

  @override
  final List<PdfSearchStrings> searchStringHistoryList;

  @override
  String toString() {
    return 'PdfSearchState.history(searchStringHistoryList: $searchStringHistoryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfSearchStateHistory &&
            (identical(
                    other.searchStringHistoryList, searchStringHistoryList) ||
                const DeepCollectionEquality().equals(
                    other.searchStringHistoryList, searchStringHistoryList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchStringHistoryList);

  @JsonKey(ignore: true)
  @override
  $PdfSearchStateHistoryCopyWith<PdfSearchStateHistory> get copyWith =>
      _$PdfSearchStateHistoryCopyWithImpl<PdfSearchStateHistory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(List<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return history(searchStringHistoryList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(List<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(searchStringHistoryList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfSearchStateData value) data,
    required TResult Function(PdfSearchStateHistory value) history,
    required TResult Function(PdfSearchStateLoading value) loading,
    required TResult Function(PdfSearchStateError value) error,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfSearchStateData value)? data,
    TResult Function(PdfSearchStateHistory value)? history,
    TResult Function(PdfSearchStateLoading value)? loading,
    TResult Function(PdfSearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class PdfSearchStateHistory implements PdfSearchState {
  const factory PdfSearchStateHistory(
      List<PdfSearchStrings> searchStringHistoryList) = _$PdfSearchStateHistory;

  List<PdfSearchStrings> get searchStringHistoryList =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfSearchStateHistoryCopyWith<PdfSearchStateHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfSearchStateLoadingCopyWith<$Res> {
  factory $PdfSearchStateLoadingCopyWith(PdfSearchStateLoading value,
          $Res Function(PdfSearchStateLoading) then) =
      _$PdfSearchStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfSearchStateLoadingCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res>
    implements $PdfSearchStateLoadingCopyWith<$Res> {
  _$PdfSearchStateLoadingCopyWithImpl(
      PdfSearchStateLoading _value, $Res Function(PdfSearchStateLoading) _then)
      : super(_value, (v) => _then(v as PdfSearchStateLoading));

  @override
  PdfSearchStateLoading get _value => super._value as PdfSearchStateLoading;
}

/// @nodoc
class _$PdfSearchStateLoading implements PdfSearchStateLoading {
  const _$PdfSearchStateLoading();

  @override
  String toString() {
    return 'PdfSearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PdfSearchStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(List<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(List<PdfSearchStrings> searchStringHistoryList)? history,
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
    required TResult Function(PdfSearchStateData value) data,
    required TResult Function(PdfSearchStateHistory value) history,
    required TResult Function(PdfSearchStateLoading value) loading,
    required TResult Function(PdfSearchStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfSearchStateData value)? data,
    TResult Function(PdfSearchStateHistory value)? history,
    TResult Function(PdfSearchStateLoading value)? loading,
    TResult Function(PdfSearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfSearchStateLoading implements PdfSearchState {
  const factory PdfSearchStateLoading() = _$PdfSearchStateLoading;
}

/// @nodoc
abstract class $PdfSearchStateErrorCopyWith<$Res> {
  factory $PdfSearchStateErrorCopyWith(
          PdfSearchStateError value, $Res Function(PdfSearchStateError) then) =
      _$PdfSearchStateErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$PdfSearchStateErrorCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res>
    implements $PdfSearchStateErrorCopyWith<$Res> {
  _$PdfSearchStateErrorCopyWithImpl(
      PdfSearchStateError _value, $Res Function(PdfSearchStateError) _then)
      : super(_value, (v) => _then(v as PdfSearchStateError));

  @override
  PdfSearchStateError get _value => super._value as PdfSearchStateError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(PdfSearchStateError(
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
class _$PdfSearchStateError implements PdfSearchStateError {
  const _$PdfSearchStateError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'PdfSearchState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PdfSearchStateError &&
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
  $PdfSearchStateErrorCopyWith<PdfSearchStateError> get copyWith =>
      _$PdfSearchStateErrorCopyWithImpl<PdfSearchStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(List<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(List<PdfSearchStrings> searchStringHistoryList)? history,
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
    required TResult Function(PdfSearchStateData value) data,
    required TResult Function(PdfSearchStateHistory value) history,
    required TResult Function(PdfSearchStateLoading value) loading,
    required TResult Function(PdfSearchStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfSearchStateData value)? data,
    TResult Function(PdfSearchStateHistory value)? history,
    TResult Function(PdfSearchStateLoading value)? loading,
    TResult Function(PdfSearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfSearchStateError implements PdfSearchState {
  const factory PdfSearchStateError(Object error, StackTrace stackTrace) =
      _$PdfSearchStateError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfSearchStateErrorCopyWith<PdfSearchStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
