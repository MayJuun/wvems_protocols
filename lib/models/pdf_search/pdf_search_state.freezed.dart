// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PdfSearchState _$PdfSearchStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'data':
      return PdfSearchStateData.fromJson(json);
    case 'history':
      return PdfSearchStateHistory.fromJson(json);
    case 'loading':
      return PdfSearchStateLoading.fromJson(json);
    case 'error':
      return PdfSearchStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PdfSearchState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PdfSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(Set<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult? Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error)? error,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfSearchStateData value)? data,
    TResult? Function(PdfSearchStateHistory value)? history,
    TResult? Function(PdfSearchStateLoading value)? loading,
    TResult? Function(PdfSearchStateError value)? error,
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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfSearchStateCopyWith<$Res> {
  factory $PdfSearchStateCopyWith(
          PdfSearchState value, $Res Function(PdfSearchState) then) =
      _$PdfSearchStateCopyWithImpl<$Res, PdfSearchState>;
}

/// @nodoc
class _$PdfSearchStateCopyWithImpl<$Res, $Val extends PdfSearchState>
    implements $PdfSearchStateCopyWith<$Res> {
  _$PdfSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PdfSearchStateDataCopyWith<$Res> {
  factory _$$PdfSearchStateDataCopyWith(_$PdfSearchStateData value,
          $Res Function(_$PdfSearchStateData) then) =
      __$$PdfSearchStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<PdfSearchStrings>> searchStringDataMap});
}

/// @nodoc
class __$$PdfSearchStateDataCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res, _$PdfSearchStateData>
    implements _$$PdfSearchStateDataCopyWith<$Res> {
  __$$PdfSearchStateDataCopyWithImpl(
      _$PdfSearchStateData _value, $Res Function(_$PdfSearchStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStringDataMap = null,
  }) {
    return _then(_$PdfSearchStateData(
      null == searchStringDataMap
          ? _value._searchStringDataMap
          : searchStringDataMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<PdfSearchStrings>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfSearchStateData implements PdfSearchStateData {
  const _$PdfSearchStateData(
      final Map<String, List<PdfSearchStrings>> searchStringDataMap,
      {final String? $type})
      : _searchStringDataMap = searchStringDataMap,
        $type = $type ?? 'data';

  factory _$PdfSearchStateData.fromJson(Map<String, dynamic> json) =>
      _$$PdfSearchStateDataFromJson(json);

  final Map<String, List<PdfSearchStrings>> _searchStringDataMap;
  @override
  Map<String, List<PdfSearchStrings>> get searchStringDataMap {
    if (_searchStringDataMap is EqualUnmodifiableMapView)
      return _searchStringDataMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchStringDataMap);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PdfSearchState.data(searchStringDataMap: $searchStringDataMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfSearchStateData &&
            const DeepCollectionEquality()
                .equals(other._searchStringDataMap, _searchStringDataMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchStringDataMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfSearchStateDataCopyWith<_$PdfSearchStateData> get copyWith =>
      __$$PdfSearchStateDataCopyWithImpl<_$PdfSearchStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(Set<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error) error,
  }) {
    return data(searchStringDataMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult? Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
  }) {
    return data?.call(searchStringDataMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error)? error,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfSearchStateData value)? data,
    TResult? Function(PdfSearchStateHistory value)? history,
    TResult? Function(PdfSearchStateLoading value)? loading,
    TResult? Function(PdfSearchStateError value)? error,
  }) {
    return data?.call(this);
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

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfSearchStateDataToJson(
      this,
    );
  }
}

abstract class PdfSearchStateData implements PdfSearchState {
  const factory PdfSearchStateData(
          final Map<String, List<PdfSearchStrings>> searchStringDataMap) =
      _$PdfSearchStateData;

  factory PdfSearchStateData.fromJson(Map<String, dynamic> json) =
      _$PdfSearchStateData.fromJson;

  Map<String, List<PdfSearchStrings>> get searchStringDataMap;
  @JsonKey(ignore: true)
  _$$PdfSearchStateDataCopyWith<_$PdfSearchStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PdfSearchStateHistoryCopyWith<$Res> {
  factory _$$PdfSearchStateHistoryCopyWith(_$PdfSearchStateHistory value,
          $Res Function(_$PdfSearchStateHistory) then) =
      __$$PdfSearchStateHistoryCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<PdfSearchStrings> searchStringHistoryList});
}

/// @nodoc
class __$$PdfSearchStateHistoryCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res, _$PdfSearchStateHistory>
    implements _$$PdfSearchStateHistoryCopyWith<$Res> {
  __$$PdfSearchStateHistoryCopyWithImpl(_$PdfSearchStateHistory _value,
      $Res Function(_$PdfSearchStateHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchStringHistoryList = null,
  }) {
    return _then(_$PdfSearchStateHistory(
      null == searchStringHistoryList
          ? _value._searchStringHistoryList
          : searchStringHistoryList // ignore: cast_nullable_to_non_nullable
              as Set<PdfSearchStrings>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfSearchStateHistory implements PdfSearchStateHistory {
  const _$PdfSearchStateHistory(
      final Set<PdfSearchStrings> searchStringHistoryList,
      {final String? $type})
      : _searchStringHistoryList = searchStringHistoryList,
        $type = $type ?? 'history';

  factory _$PdfSearchStateHistory.fromJson(Map<String, dynamic> json) =>
      _$$PdfSearchStateHistoryFromJson(json);

  final Set<PdfSearchStrings> _searchStringHistoryList;
  @override
  Set<PdfSearchStrings> get searchStringHistoryList {
    if (_searchStringHistoryList is EqualUnmodifiableSetView)
      return _searchStringHistoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_searchStringHistoryList);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PdfSearchState.history(searchStringHistoryList: $searchStringHistoryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfSearchStateHistory &&
            const DeepCollectionEquality().equals(
                other._searchStringHistoryList, _searchStringHistoryList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_searchStringHistoryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfSearchStateHistoryCopyWith<_$PdfSearchStateHistory> get copyWith =>
      __$$PdfSearchStateHistoryCopyWithImpl<_$PdfSearchStateHistory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(Set<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error) error,
  }) {
    return history(searchStringHistoryList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult? Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
  }) {
    return history?.call(searchStringHistoryList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error)? error,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfSearchStateData value)? data,
    TResult? Function(PdfSearchStateHistory value)? history,
    TResult? Function(PdfSearchStateLoading value)? loading,
    TResult? Function(PdfSearchStateError value)? error,
  }) {
    return history?.call(this);
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

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfSearchStateHistoryToJson(
      this,
    );
  }
}

abstract class PdfSearchStateHistory implements PdfSearchState {
  const factory PdfSearchStateHistory(
          final Set<PdfSearchStrings> searchStringHistoryList) =
      _$PdfSearchStateHistory;

  factory PdfSearchStateHistory.fromJson(Map<String, dynamic> json) =
      _$PdfSearchStateHistory.fromJson;

  Set<PdfSearchStrings> get searchStringHistoryList;
  @JsonKey(ignore: true)
  _$$PdfSearchStateHistoryCopyWith<_$PdfSearchStateHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PdfSearchStateLoadingCopyWith<$Res> {
  factory _$$PdfSearchStateLoadingCopyWith(_$PdfSearchStateLoading value,
          $Res Function(_$PdfSearchStateLoading) then) =
      __$$PdfSearchStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PdfSearchStateLoadingCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res, _$PdfSearchStateLoading>
    implements _$$PdfSearchStateLoadingCopyWith<$Res> {
  __$$PdfSearchStateLoadingCopyWithImpl(_$PdfSearchStateLoading _value,
      $Res Function(_$PdfSearchStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PdfSearchStateLoading implements PdfSearchStateLoading {
  const _$PdfSearchStateLoading({final String? $type})
      : $type = $type ?? 'loading';

  factory _$PdfSearchStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$PdfSearchStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PdfSearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PdfSearchStateLoading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(Set<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult? Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error)? error,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfSearchStateData value)? data,
    TResult? Function(PdfSearchStateHistory value)? history,
    TResult? Function(PdfSearchStateLoading value)? loading,
    TResult? Function(PdfSearchStateError value)? error,
  }) {
    return loading?.call(this);
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

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfSearchStateLoadingToJson(
      this,
    );
  }
}

abstract class PdfSearchStateLoading implements PdfSearchState {
  const factory PdfSearchStateLoading() = _$PdfSearchStateLoading;

  factory PdfSearchStateLoading.fromJson(Map<String, dynamic> json) =
      _$PdfSearchStateLoading.fromJson;
}

/// @nodoc
abstract class _$$PdfSearchStateErrorCopyWith<$Res> {
  factory _$$PdfSearchStateErrorCopyWith(_$PdfSearchStateError value,
          $Res Function(_$PdfSearchStateError) then) =
      __$$PdfSearchStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$PdfSearchStateErrorCopyWithImpl<$Res>
    extends _$PdfSearchStateCopyWithImpl<$Res, _$PdfSearchStateError>
    implements _$$PdfSearchStateErrorCopyWith<$Res> {
  __$$PdfSearchStateErrorCopyWithImpl(
      _$PdfSearchStateError _value, $Res Function(_$PdfSearchStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PdfSearchStateError(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfSearchStateError implements PdfSearchStateError {
  const _$PdfSearchStateError(this.error, {final String? $type})
      : $type = $type ?? 'error';

  factory _$PdfSearchStateError.fromJson(Map<String, dynamic> json) =>
      _$$PdfSearchStateErrorFromJson(json);

  @override
  final Object error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PdfSearchState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfSearchStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfSearchStateErrorCopyWith<_$PdfSearchStateError> get copyWith =>
      __$$PdfSearchStateErrorCopyWithImpl<_$PdfSearchStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, List<PdfSearchStrings>> searchStringDataMap)
        data,
    required TResult Function(Set<PdfSearchStrings> searchStringHistoryList)
        history,
    required TResult Function() loading,
    required TResult Function(Object error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult? Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult? Function()? loading,
    TResult? Function(Object error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, List<PdfSearchStrings>> searchStringDataMap)?
        data,
    TResult Function(Set<PdfSearchStrings> searchStringHistoryList)? history,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PdfSearchStateData value)? data,
    TResult? Function(PdfSearchStateHistory value)? history,
    TResult? Function(PdfSearchStateLoading value)? loading,
    TResult? Function(PdfSearchStateError value)? error,
  }) {
    return error?.call(this);
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

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfSearchStateErrorToJson(
      this,
    );
  }
}

abstract class PdfSearchStateError implements PdfSearchState {
  const factory PdfSearchStateError(final Object error) = _$PdfSearchStateError;

  factory PdfSearchStateError.fromJson(Map<String, dynamic> json) =
      _$PdfSearchStateError.fromJson;

  Object get error;
  @JsonKey(ignore: true)
  _$$PdfSearchStateErrorCopyWith<_$PdfSearchStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
