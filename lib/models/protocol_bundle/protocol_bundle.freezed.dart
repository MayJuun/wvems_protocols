// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'protocol_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProtocolBundle {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function(String bundleId) downloading,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult? Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult? Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult? Function(String bundleId)? downloading,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function(String bundleId)? downloading,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolBundleAsAssets value) asAssets,
    required TResult Function(ProtocolBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolBundleAsFiles value) asFiles,
    required TResult Function(ProtocoleBundleDownloading value) downloading,
    required TResult Function(ProtocolBundleLoading value) loading,
    required TResult Function(ProtocolBundleError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProtocolBundleAsAssets value)? asAssets,
    TResult? Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult? Function(ProtocolBundleAsFiles value)? asFiles,
    TResult? Function(ProtocoleBundleDownloading value)? downloading,
    TResult? Function(ProtocolBundleLoading value)? loading,
    TResult? Function(ProtocolBundleError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolBundleAsAssets value)? asAssets,
    TResult Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolBundleAsFiles value)? asFiles,
    TResult Function(ProtocoleBundleDownloading value)? downloading,
    TResult Function(ProtocolBundleLoading value)? loading,
    TResult Function(ProtocolBundleError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolBundleCopyWith<$Res> {
  factory $ProtocolBundleCopyWith(
          ProtocolBundle value, $Res Function(ProtocolBundle) then) =
      _$ProtocolBundleCopyWithImpl<$Res, ProtocolBundle>;
}

/// @nodoc
class _$ProtocolBundleCopyWithImpl<$Res, $Val extends ProtocolBundle>
    implements $ProtocolBundleCopyWith<$Res> {
  _$ProtocolBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProtocolBundleAsAssetsCopyWith<$Res> {
  factory _$$ProtocolBundleAsAssetsCopyWith(_$ProtocolBundleAsAssets value,
          $Res Function(_$ProtocolBundleAsAssets) then) =
      __$$ProtocolBundleAsAssetsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String bundleId,
      int bundleVersion,
      int year,
      String pdfAssetPath,
      String jsonAssetPath,
      String tocJsonAssetPath});
}

/// @nodoc
class __$$ProtocolBundleAsAssetsCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res, _$ProtocolBundleAsAssets>
    implements _$$ProtocolBundleAsAssetsCopyWith<$Res> {
  __$$ProtocolBundleAsAssetsCopyWithImpl(_$ProtocolBundleAsAssets _value,
      $Res Function(_$ProtocolBundleAsAssets) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleId = null,
    Object? bundleVersion = null,
    Object? year = null,
    Object? pdfAssetPath = null,
    Object? jsonAssetPath = null,
    Object? tocJsonAssetPath = null,
  }) {
    return _then(_$ProtocolBundleAsAssets(
      bundleId: null == bundleId
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion: null == bundleVersion
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pdfAssetPath: null == pdfAssetPath
          ? _value.pdfAssetPath
          : pdfAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      jsonAssetPath: null == jsonAssetPath
          ? _value.jsonAssetPath
          : jsonAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      tocJsonAssetPath: null == tocJsonAssetPath
          ? _value.tocJsonAssetPath
          : tocJsonAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProtocolBundleAsAssets implements ProtocolBundleAsAssets {
  const _$ProtocolBundleAsAssets(
      {required this.bundleId,
      required this.bundleVersion,
      required this.year,
      required this.pdfAssetPath,
      required this.jsonAssetPath,
      required this.tocJsonAssetPath});

  @override
  final String bundleId;
  @override
  final int bundleVersion;
  @override
  final int year;
  @override
  final String pdfAssetPath;
  @override
  final String jsonAssetPath;
  @override
  final String tocJsonAssetPath;

  @override
  String toString() {
    return 'ProtocolBundle.asAssets(bundleId: $bundleId, bundleVersion: $bundleVersion, year: $year, pdfAssetPath: $pdfAssetPath, jsonAssetPath: $jsonAssetPath, tocJsonAssetPath: $tocJsonAssetPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolBundleAsAssets &&
            (identical(other.bundleId, bundleId) ||
                other.bundleId == bundleId) &&
            (identical(other.bundleVersion, bundleVersion) ||
                other.bundleVersion == bundleVersion) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.pdfAssetPath, pdfAssetPath) ||
                other.pdfAssetPath == pdfAssetPath) &&
            (identical(other.jsonAssetPath, jsonAssetPath) ||
                other.jsonAssetPath == jsonAssetPath) &&
            (identical(other.tocJsonAssetPath, tocJsonAssetPath) ||
                other.tocJsonAssetPath == tocJsonAssetPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundleId, bundleVersion, year,
      pdfAssetPath, jsonAssetPath, tocJsonAssetPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolBundleAsAssetsCopyWith<_$ProtocolBundleAsAssets> get copyWith =>
      __$$ProtocolBundleAsAssetsCopyWithImpl<_$ProtocolBundleAsAssets>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function(String bundleId) downloading,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return asAssets(bundleId, bundleVersion, year, pdfAssetPath, jsonAssetPath,
        tocJsonAssetPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult? Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult? Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult? Function(String bundleId)? downloading,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return asAssets?.call(bundleId, bundleVersion, year, pdfAssetPath,
        jsonAssetPath, tocJsonAssetPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function(String bundleId)? downloading,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (asAssets != null) {
      return asAssets(bundleId, bundleVersion, year, pdfAssetPath,
          jsonAssetPath, tocJsonAssetPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolBundleAsAssets value) asAssets,
    required TResult Function(ProtocolBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolBundleAsFiles value) asFiles,
    required TResult Function(ProtocoleBundleDownloading value) downloading,
    required TResult Function(ProtocolBundleLoading value) loading,
    required TResult Function(ProtocolBundleError value) error,
  }) {
    return asAssets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProtocolBundleAsAssets value)? asAssets,
    TResult? Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult? Function(ProtocolBundleAsFiles value)? asFiles,
    TResult? Function(ProtocoleBundleDownloading value)? downloading,
    TResult? Function(ProtocolBundleLoading value)? loading,
    TResult? Function(ProtocolBundleError value)? error,
  }) {
    return asAssets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolBundleAsAssets value)? asAssets,
    TResult Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolBundleAsFiles value)? asFiles,
    TResult Function(ProtocoleBundleDownloading value)? downloading,
    TResult Function(ProtocolBundleLoading value)? loading,
    TResult Function(ProtocolBundleError value)? error,
    required TResult orElse(),
  }) {
    if (asAssets != null) {
      return asAssets(this);
    }
    return orElse();
  }
}

abstract class ProtocolBundleAsAssets implements ProtocolBundle {
  const factory ProtocolBundleAsAssets(
      {required final String bundleId,
      required final int bundleVersion,
      required final int year,
      required final String pdfAssetPath,
      required final String jsonAssetPath,
      required final String tocJsonAssetPath}) = _$ProtocolBundleAsAssets;

  String get bundleId;
  int get bundleVersion;
  int get year;
  String get pdfAssetPath;
  String get jsonAssetPath;
  String get tocJsonAssetPath;
  @JsonKey(ignore: true)
  _$$ProtocolBundleAsAssetsCopyWith<_$ProtocolBundleAsAssets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProtocolBundleAsFirebaseRefsCopyWith<$Res> {
  factory _$$ProtocolBundleAsFirebaseRefsCopyWith(
          _$ProtocolBundleAsFirebaseRefs value,
          $Res Function(_$ProtocolBundleAsFirebaseRefs) then) =
      __$$ProtocolBundleAsFirebaseRefsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String bundleId,
      int bundleVersion,
      int year,
      int pdfFileSize,
      Reference pdfRef,
      Reference jsonRef,
      Reference tocJsonRef});
}

/// @nodoc
class __$$ProtocolBundleAsFirebaseRefsCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res, _$ProtocolBundleAsFirebaseRefs>
    implements _$$ProtocolBundleAsFirebaseRefsCopyWith<$Res> {
  __$$ProtocolBundleAsFirebaseRefsCopyWithImpl(
      _$ProtocolBundleAsFirebaseRefs _value,
      $Res Function(_$ProtocolBundleAsFirebaseRefs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleId = null,
    Object? bundleVersion = null,
    Object? year = null,
    Object? pdfFileSize = null,
    Object? pdfRef = null,
    Object? jsonRef = null,
    Object? tocJsonRef = null,
  }) {
    return _then(_$ProtocolBundleAsFirebaseRefs(
      bundleId: null == bundleId
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion: null == bundleVersion
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pdfFileSize: null == pdfFileSize
          ? _value.pdfFileSize
          : pdfFileSize // ignore: cast_nullable_to_non_nullable
              as int,
      pdfRef: null == pdfRef
          ? _value.pdfRef
          : pdfRef // ignore: cast_nullable_to_non_nullable
              as Reference,
      jsonRef: null == jsonRef
          ? _value.jsonRef
          : jsonRef // ignore: cast_nullable_to_non_nullable
              as Reference,
      tocJsonRef: null == tocJsonRef
          ? _value.tocJsonRef
          : tocJsonRef // ignore: cast_nullable_to_non_nullable
              as Reference,
    ));
  }
}

/// @nodoc

class _$ProtocolBundleAsFirebaseRefs implements ProtocolBundleAsFirebaseRefs {
  const _$ProtocolBundleAsFirebaseRefs(
      {required this.bundleId,
      required this.bundleVersion,
      required this.year,
      required this.pdfFileSize,
      required this.pdfRef,
      required this.jsonRef,
      required this.tocJsonRef});

  @override
  final String bundleId;
  @override
  final int bundleVersion;
  @override
  final int year;
  @override
  final int pdfFileSize;
  @override
  final Reference pdfRef;
  @override
  final Reference jsonRef;
  @override
  final Reference tocJsonRef;

  @override
  String toString() {
    return 'ProtocolBundle.asFirebaseRefs(bundleId: $bundleId, bundleVersion: $bundleVersion, year: $year, pdfFileSize: $pdfFileSize, pdfRef: $pdfRef, jsonRef: $jsonRef, tocJsonRef: $tocJsonRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolBundleAsFirebaseRefs &&
            (identical(other.bundleId, bundleId) ||
                other.bundleId == bundleId) &&
            (identical(other.bundleVersion, bundleVersion) ||
                other.bundleVersion == bundleVersion) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.pdfFileSize, pdfFileSize) ||
                other.pdfFileSize == pdfFileSize) &&
            (identical(other.pdfRef, pdfRef) || other.pdfRef == pdfRef) &&
            (identical(other.jsonRef, jsonRef) || other.jsonRef == jsonRef) &&
            (identical(other.tocJsonRef, tocJsonRef) ||
                other.tocJsonRef == tocJsonRef));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundleId, bundleVersion, year,
      pdfFileSize, pdfRef, jsonRef, tocJsonRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolBundleAsFirebaseRefsCopyWith<_$ProtocolBundleAsFirebaseRefs>
      get copyWith => __$$ProtocolBundleAsFirebaseRefsCopyWithImpl<
          _$ProtocolBundleAsFirebaseRefs>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function(String bundleId) downloading,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return asFirebaseRefs(bundleId, bundleVersion, year, pdfFileSize, pdfRef,
        jsonRef, tocJsonRef);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult? Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult? Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult? Function(String bundleId)? downloading,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return asFirebaseRefs?.call(bundleId, bundleVersion, year, pdfFileSize,
        pdfRef, jsonRef, tocJsonRef);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function(String bundleId)? downloading,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (asFirebaseRefs != null) {
      return asFirebaseRefs(bundleId, bundleVersion, year, pdfFileSize, pdfRef,
          jsonRef, tocJsonRef);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolBundleAsAssets value) asAssets,
    required TResult Function(ProtocolBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolBundleAsFiles value) asFiles,
    required TResult Function(ProtocoleBundleDownloading value) downloading,
    required TResult Function(ProtocolBundleLoading value) loading,
    required TResult Function(ProtocolBundleError value) error,
  }) {
    return asFirebaseRefs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProtocolBundleAsAssets value)? asAssets,
    TResult? Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult? Function(ProtocolBundleAsFiles value)? asFiles,
    TResult? Function(ProtocoleBundleDownloading value)? downloading,
    TResult? Function(ProtocolBundleLoading value)? loading,
    TResult? Function(ProtocolBundleError value)? error,
  }) {
    return asFirebaseRefs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolBundleAsAssets value)? asAssets,
    TResult Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolBundleAsFiles value)? asFiles,
    TResult Function(ProtocoleBundleDownloading value)? downloading,
    TResult Function(ProtocolBundleLoading value)? loading,
    TResult Function(ProtocolBundleError value)? error,
    required TResult orElse(),
  }) {
    if (asFirebaseRefs != null) {
      return asFirebaseRefs(this);
    }
    return orElse();
  }
}

abstract class ProtocolBundleAsFirebaseRefs implements ProtocolBundle {
  const factory ProtocolBundleAsFirebaseRefs(
      {required final String bundleId,
      required final int bundleVersion,
      required final int year,
      required final int pdfFileSize,
      required final Reference pdfRef,
      required final Reference jsonRef,
      required final Reference tocJsonRef}) = _$ProtocolBundleAsFirebaseRefs;

  String get bundleId;
  int get bundleVersion;
  int get year;
  int get pdfFileSize;
  Reference get pdfRef;
  Reference get jsonRef;
  Reference get tocJsonRef;
  @JsonKey(ignore: true)
  _$$ProtocolBundleAsFirebaseRefsCopyWith<_$ProtocolBundleAsFirebaseRefs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProtocolBundleAsFilesCopyWith<$Res> {
  factory _$$ProtocolBundleAsFilesCopyWith(_$ProtocolBundleAsFiles value,
          $Res Function(_$ProtocolBundleAsFiles) then) =
      __$$ProtocolBundleAsFilesCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String bundleId,
      int bundleVersion,
      int year,
      int pdfFileSize,
      File pdfFile,
      File jsonFile,
      File tocJsonFile});
}

/// @nodoc
class __$$ProtocolBundleAsFilesCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res, _$ProtocolBundleAsFiles>
    implements _$$ProtocolBundleAsFilesCopyWith<$Res> {
  __$$ProtocolBundleAsFilesCopyWithImpl(_$ProtocolBundleAsFiles _value,
      $Res Function(_$ProtocolBundleAsFiles) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleId = null,
    Object? bundleVersion = null,
    Object? year = null,
    Object? pdfFileSize = null,
    Object? pdfFile = null,
    Object? jsonFile = null,
    Object? tocJsonFile = null,
  }) {
    return _then(_$ProtocolBundleAsFiles(
      bundleId: null == bundleId
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion: null == bundleVersion
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pdfFileSize: null == pdfFileSize
          ? _value.pdfFileSize
          : pdfFileSize // ignore: cast_nullable_to_non_nullable
              as int,
      pdfFile: null == pdfFile
          ? _value.pdfFile
          : pdfFile // ignore: cast_nullable_to_non_nullable
              as File,
      jsonFile: null == jsonFile
          ? _value.jsonFile
          : jsonFile // ignore: cast_nullable_to_non_nullable
              as File,
      tocJsonFile: null == tocJsonFile
          ? _value.tocJsonFile
          : tocJsonFile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ProtocolBundleAsFiles implements ProtocolBundleAsFiles {
  const _$ProtocolBundleAsFiles(
      {required this.bundleId,
      required this.bundleVersion,
      required this.year,
      required this.pdfFileSize,
      required this.pdfFile,
      required this.jsonFile,
      required this.tocJsonFile});

  @override
  final String bundleId;
  @override
  final int bundleVersion;
  @override
  final int year;
  @override
  final int pdfFileSize;
  @override
  final File pdfFile;
  @override
  final File jsonFile;
  @override
  final File tocJsonFile;

  @override
  String toString() {
    return 'ProtocolBundle.asFiles(bundleId: $bundleId, bundleVersion: $bundleVersion, year: $year, pdfFileSize: $pdfFileSize, pdfFile: $pdfFile, jsonFile: $jsonFile, tocJsonFile: $tocJsonFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolBundleAsFiles &&
            (identical(other.bundleId, bundleId) ||
                other.bundleId == bundleId) &&
            (identical(other.bundleVersion, bundleVersion) ||
                other.bundleVersion == bundleVersion) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.pdfFileSize, pdfFileSize) ||
                other.pdfFileSize == pdfFileSize) &&
            (identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile) &&
            (identical(other.jsonFile, jsonFile) ||
                other.jsonFile == jsonFile) &&
            (identical(other.tocJsonFile, tocJsonFile) ||
                other.tocJsonFile == tocJsonFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundleId, bundleVersion, year,
      pdfFileSize, pdfFile, jsonFile, tocJsonFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolBundleAsFilesCopyWith<_$ProtocolBundleAsFiles> get copyWith =>
      __$$ProtocolBundleAsFilesCopyWithImpl<_$ProtocolBundleAsFiles>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function(String bundleId) downloading,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return asFiles(bundleId, bundleVersion, year, pdfFileSize, pdfFile,
        jsonFile, tocJsonFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult? Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult? Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult? Function(String bundleId)? downloading,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return asFiles?.call(bundleId, bundleVersion, year, pdfFileSize, pdfFile,
        jsonFile, tocJsonFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function(String bundleId)? downloading,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (asFiles != null) {
      return asFiles(bundleId, bundleVersion, year, pdfFileSize, pdfFile,
          jsonFile, tocJsonFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolBundleAsAssets value) asAssets,
    required TResult Function(ProtocolBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolBundleAsFiles value) asFiles,
    required TResult Function(ProtocoleBundleDownloading value) downloading,
    required TResult Function(ProtocolBundleLoading value) loading,
    required TResult Function(ProtocolBundleError value) error,
  }) {
    return asFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProtocolBundleAsAssets value)? asAssets,
    TResult? Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult? Function(ProtocolBundleAsFiles value)? asFiles,
    TResult? Function(ProtocoleBundleDownloading value)? downloading,
    TResult? Function(ProtocolBundleLoading value)? loading,
    TResult? Function(ProtocolBundleError value)? error,
  }) {
    return asFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolBundleAsAssets value)? asAssets,
    TResult Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolBundleAsFiles value)? asFiles,
    TResult Function(ProtocoleBundleDownloading value)? downloading,
    TResult Function(ProtocolBundleLoading value)? loading,
    TResult Function(ProtocolBundleError value)? error,
    required TResult orElse(),
  }) {
    if (asFiles != null) {
      return asFiles(this);
    }
    return orElse();
  }
}

abstract class ProtocolBundleAsFiles implements ProtocolBundle {
  const factory ProtocolBundleAsFiles(
      {required final String bundleId,
      required final int bundleVersion,
      required final int year,
      required final int pdfFileSize,
      required final File pdfFile,
      required final File jsonFile,
      required final File tocJsonFile}) = _$ProtocolBundleAsFiles;

  String get bundleId;
  int get bundleVersion;
  int get year;
  int get pdfFileSize;
  File get pdfFile;
  File get jsonFile;
  File get tocJsonFile;
  @JsonKey(ignore: true)
  _$$ProtocolBundleAsFilesCopyWith<_$ProtocolBundleAsFiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProtocoleBundleDownloadingCopyWith<$Res> {
  factory _$$ProtocoleBundleDownloadingCopyWith(
          _$ProtocoleBundleDownloading value,
          $Res Function(_$ProtocoleBundleDownloading) then) =
      __$$ProtocoleBundleDownloadingCopyWithImpl<$Res>;
  @useResult
  $Res call({String bundleId});
}

/// @nodoc
class __$$ProtocoleBundleDownloadingCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res, _$ProtocoleBundleDownloading>
    implements _$$ProtocoleBundleDownloadingCopyWith<$Res> {
  __$$ProtocoleBundleDownloadingCopyWithImpl(
      _$ProtocoleBundleDownloading _value,
      $Res Function(_$ProtocoleBundleDownloading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleId = null,
  }) {
    return _then(_$ProtocoleBundleDownloading(
      bundleId: null == bundleId
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProtocoleBundleDownloading implements ProtocoleBundleDownloading {
  const _$ProtocoleBundleDownloading({required this.bundleId});

  @override
  final String bundleId;

  @override
  String toString() {
    return 'ProtocolBundle.downloading(bundleId: $bundleId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocoleBundleDownloading &&
            (identical(other.bundleId, bundleId) ||
                other.bundleId == bundleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundleId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocoleBundleDownloadingCopyWith<_$ProtocoleBundleDownloading>
      get copyWith => __$$ProtocoleBundleDownloadingCopyWithImpl<
          _$ProtocoleBundleDownloading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function(String bundleId) downloading,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return downloading(bundleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult? Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult? Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult? Function(String bundleId)? downloading,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return downloading?.call(bundleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function(String bundleId)? downloading,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(bundleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolBundleAsAssets value) asAssets,
    required TResult Function(ProtocolBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolBundleAsFiles value) asFiles,
    required TResult Function(ProtocoleBundleDownloading value) downloading,
    required TResult Function(ProtocolBundleLoading value) loading,
    required TResult Function(ProtocolBundleError value) error,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProtocolBundleAsAssets value)? asAssets,
    TResult? Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult? Function(ProtocolBundleAsFiles value)? asFiles,
    TResult? Function(ProtocoleBundleDownloading value)? downloading,
    TResult? Function(ProtocolBundleLoading value)? loading,
    TResult? Function(ProtocolBundleError value)? error,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolBundleAsAssets value)? asAssets,
    TResult Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolBundleAsFiles value)? asFiles,
    TResult Function(ProtocoleBundleDownloading value)? downloading,
    TResult Function(ProtocolBundleLoading value)? loading,
    TResult Function(ProtocolBundleError value)? error,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }
}

abstract class ProtocoleBundleDownloading implements ProtocolBundle {
  const factory ProtocoleBundleDownloading({required final String bundleId}) =
      _$ProtocoleBundleDownloading;

  String get bundleId;
  @JsonKey(ignore: true)
  _$$ProtocoleBundleDownloadingCopyWith<_$ProtocoleBundleDownloading>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProtocolBundleLoadingCopyWith<$Res> {
  factory _$$ProtocolBundleLoadingCopyWith(_$ProtocolBundleLoading value,
          $Res Function(_$ProtocolBundleLoading) then) =
      __$$ProtocolBundleLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProtocolBundleLoadingCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res, _$ProtocolBundleLoading>
    implements _$$ProtocolBundleLoadingCopyWith<$Res> {
  __$$ProtocolBundleLoadingCopyWithImpl(_$ProtocolBundleLoading _value,
      $Res Function(_$ProtocolBundleLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProtocolBundleLoading implements ProtocolBundleLoading {
  const _$ProtocolBundleLoading();

  @override
  String toString() {
    return 'ProtocolBundle.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProtocolBundleLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function(String bundleId) downloading,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult? Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult? Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult? Function(String bundleId)? downloading,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function(String bundleId)? downloading,
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
    required TResult Function(ProtocolBundleAsAssets value) asAssets,
    required TResult Function(ProtocolBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolBundleAsFiles value) asFiles,
    required TResult Function(ProtocoleBundleDownloading value) downloading,
    required TResult Function(ProtocolBundleLoading value) loading,
    required TResult Function(ProtocolBundleError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProtocolBundleAsAssets value)? asAssets,
    TResult? Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult? Function(ProtocolBundleAsFiles value)? asFiles,
    TResult? Function(ProtocoleBundleDownloading value)? downloading,
    TResult? Function(ProtocolBundleLoading value)? loading,
    TResult? Function(ProtocolBundleError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolBundleAsAssets value)? asAssets,
    TResult Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolBundleAsFiles value)? asFiles,
    TResult Function(ProtocoleBundleDownloading value)? downloading,
    TResult Function(ProtocolBundleLoading value)? loading,
    TResult Function(ProtocolBundleError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProtocolBundleLoading implements ProtocolBundle {
  const factory ProtocolBundleLoading() = _$ProtocolBundleLoading;
}

/// @nodoc
abstract class _$$ProtocolBundleErrorCopyWith<$Res> {
  factory _$$ProtocolBundleErrorCopyWith(_$ProtocolBundleError value,
          $Res Function(_$ProtocolBundleError) then) =
      __$$ProtocolBundleErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$ProtocolBundleErrorCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res, _$ProtocolBundleError>
    implements _$$ProtocolBundleErrorCopyWith<$Res> {
  __$$ProtocolBundleErrorCopyWithImpl(
      _$ProtocolBundleError _value, $Res Function(_$ProtocolBundleError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$ProtocolBundleError(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ProtocolBundleError implements ProtocolBundleError {
  const _$ProtocolBundleError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ProtocolBundle.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolBundleError &&
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
  _$$ProtocolBundleErrorCopyWith<_$ProtocolBundleError> get copyWith =>
      __$$ProtocolBundleErrorCopyWithImpl<_$ProtocolBundleError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function(String bundleId) downloading,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult? Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult? Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult? Function(String bundleId)? downloading,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, int year,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(
            String bundleId,
            int bundleVersion,
            int year,
            int pdfFileSize,
            Reference pdfRef,
            Reference jsonRef,
            Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, int year,
            int pdfFileSize, File pdfFile, File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function(String bundleId)? downloading,
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
    required TResult Function(ProtocolBundleAsAssets value) asAssets,
    required TResult Function(ProtocolBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolBundleAsFiles value) asFiles,
    required TResult Function(ProtocoleBundleDownloading value) downloading,
    required TResult Function(ProtocolBundleLoading value) loading,
    required TResult Function(ProtocolBundleError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProtocolBundleAsAssets value)? asAssets,
    TResult? Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult? Function(ProtocolBundleAsFiles value)? asFiles,
    TResult? Function(ProtocoleBundleDownloading value)? downloading,
    TResult? Function(ProtocolBundleLoading value)? loading,
    TResult? Function(ProtocolBundleError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolBundleAsAssets value)? asAssets,
    TResult Function(ProtocolBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolBundleAsFiles value)? asFiles,
    TResult Function(ProtocoleBundleDownloading value)? downloading,
    TResult Function(ProtocolBundleLoading value)? loading,
    TResult Function(ProtocolBundleError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProtocolBundleError implements ProtocolBundle {
  const factory ProtocolBundleError(
      final Object error, final StackTrace stackTrace) = _$ProtocolBundleError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$ProtocolBundleErrorCopyWith<_$ProtocolBundleError> get copyWith =>
      throw _privateConstructorUsedError;
}
