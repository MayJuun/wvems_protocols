// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'protocol_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProtocolBundleTearOff {
  const _$ProtocolBundleTearOff();

  ProtocolBundleAsAssets asAssets(
      {required String bundleId,
      required int bundleVersion,
      required int year,
      required String pdfAssetPath,
      required String jsonAssetPath,
      required String tocJsonAssetPath}) {
    return ProtocolBundleAsAssets(
      bundleId: bundleId,
      bundleVersion: bundleVersion,
      year: year,
      pdfAssetPath: pdfAssetPath,
      jsonAssetPath: jsonAssetPath,
      tocJsonAssetPath: tocJsonAssetPath,
    );
  }

  ProtocolBundleAsFirebaseRefs asFirebaseRefs(
      {required String bundleId,
      required int bundleVersion,
      required int year,
      required int pdfFileSize,
      required Reference pdfRef,
      required Reference jsonRef,
      required Reference tocJsonRef}) {
    return ProtocolBundleAsFirebaseRefs(
      bundleId: bundleId,
      bundleVersion: bundleVersion,
      year: year,
      pdfFileSize: pdfFileSize,
      pdfRef: pdfRef,
      jsonRef: jsonRef,
      tocJsonRef: tocJsonRef,
    );
  }

  ProtocolBundleAsFiles asFiles(
      {required String bundleId,
      required int bundleVersion,
      required int year,
      required int pdfFileSize,
      required File pdfFile,
      required File jsonFile,
      required File tocJsonFile}) {
    return ProtocolBundleAsFiles(
      bundleId: bundleId,
      bundleVersion: bundleVersion,
      year: year,
      pdfFileSize: pdfFileSize,
      pdfFile: pdfFile,
      jsonFile: jsonFile,
      tocJsonFile: tocJsonFile,
    );
  }

  ProtocoleBundleDownloading downloading({required String bundleId}) {
    return ProtocoleBundleDownloading(
      bundleId: bundleId,
    );
  }

  ProtocolBundleLoading loading() {
    return const ProtocolBundleLoading();
  }

  ProtocolBundleError error(Object error, StackTrace stackTrace) {
    return ProtocolBundleError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $ProtocolBundle = _$ProtocolBundleTearOff();

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
      _$ProtocolBundleCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProtocolBundleCopyWithImpl<$Res>
    implements $ProtocolBundleCopyWith<$Res> {
  _$ProtocolBundleCopyWithImpl(this._value, this._then);

  final ProtocolBundle _value;
  // ignore: unused_field
  final $Res Function(ProtocolBundle) _then;
}

/// @nodoc
abstract class $ProtocolBundleAsAssetsCopyWith<$Res> {
  factory $ProtocolBundleAsAssetsCopyWith(ProtocolBundleAsAssets value,
          $Res Function(ProtocolBundleAsAssets) then) =
      _$ProtocolBundleAsAssetsCopyWithImpl<$Res>;
  $Res call(
      {String bundleId,
      int bundleVersion,
      int year,
      String pdfAssetPath,
      String jsonAssetPath,
      String tocJsonAssetPath});
}

/// @nodoc
class _$ProtocolBundleAsAssetsCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res>
    implements $ProtocolBundleAsAssetsCopyWith<$Res> {
  _$ProtocolBundleAsAssetsCopyWithImpl(ProtocolBundleAsAssets _value,
      $Res Function(ProtocolBundleAsAssets) _then)
      : super(_value, (v) => _then(v as ProtocolBundleAsAssets));

  @override
  ProtocolBundleAsAssets get _value => super._value as ProtocolBundleAsAssets;

  @override
  $Res call({
    Object? bundleId = freezed,
    Object? bundleVersion = freezed,
    Object? year = freezed,
    Object? pdfAssetPath = freezed,
    Object? jsonAssetPath = freezed,
    Object? tocJsonAssetPath = freezed,
  }) {
    return _then(ProtocolBundleAsAssets(
      bundleId: bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion: bundleVersion == freezed
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pdfAssetPath: pdfAssetPath == freezed
          ? _value.pdfAssetPath
          : pdfAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      jsonAssetPath: jsonAssetPath == freezed
          ? _value.jsonAssetPath
          : jsonAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      tocJsonAssetPath: tocJsonAssetPath == freezed
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
        (other is ProtocolBundleAsAssets &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)) &&
            (identical(other.bundleVersion, bundleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.bundleVersion, bundleVersion)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.pdfAssetPath, pdfAssetPath) ||
                const DeepCollectionEquality()
                    .equals(other.pdfAssetPath, pdfAssetPath)) &&
            (identical(other.jsonAssetPath, jsonAssetPath) ||
                const DeepCollectionEquality()
                    .equals(other.jsonAssetPath, jsonAssetPath)) &&
            (identical(other.tocJsonAssetPath, tocJsonAssetPath) ||
                const DeepCollectionEquality()
                    .equals(other.tocJsonAssetPath, tocJsonAssetPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bundleId) ^
      const DeepCollectionEquality().hash(bundleVersion) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(pdfAssetPath) ^
      const DeepCollectionEquality().hash(jsonAssetPath) ^
      const DeepCollectionEquality().hash(tocJsonAssetPath);

  @JsonKey(ignore: true)
  @override
  $ProtocolBundleAsAssetsCopyWith<ProtocolBundleAsAssets> get copyWith =>
      _$ProtocolBundleAsAssetsCopyWithImpl<ProtocolBundleAsAssets>(
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
      {required String bundleId,
      required int bundleVersion,
      required int year,
      required String pdfAssetPath,
      required String jsonAssetPath,
      required String tocJsonAssetPath}) = _$ProtocolBundleAsAssets;

  String get bundleId => throw _privateConstructorUsedError;
  int get bundleVersion => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get pdfAssetPath => throw _privateConstructorUsedError;
  String get jsonAssetPath => throw _privateConstructorUsedError;
  String get tocJsonAssetPath => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolBundleAsAssetsCopyWith<ProtocolBundleAsAssets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolBundleAsFirebaseRefsCopyWith<$Res> {
  factory $ProtocolBundleAsFirebaseRefsCopyWith(
          ProtocolBundleAsFirebaseRefs value,
          $Res Function(ProtocolBundleAsFirebaseRefs) then) =
      _$ProtocolBundleAsFirebaseRefsCopyWithImpl<$Res>;
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
class _$ProtocolBundleAsFirebaseRefsCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res>
    implements $ProtocolBundleAsFirebaseRefsCopyWith<$Res> {
  _$ProtocolBundleAsFirebaseRefsCopyWithImpl(
      ProtocolBundleAsFirebaseRefs _value,
      $Res Function(ProtocolBundleAsFirebaseRefs) _then)
      : super(_value, (v) => _then(v as ProtocolBundleAsFirebaseRefs));

  @override
  ProtocolBundleAsFirebaseRefs get _value =>
      super._value as ProtocolBundleAsFirebaseRefs;

  @override
  $Res call({
    Object? bundleId = freezed,
    Object? bundleVersion = freezed,
    Object? year = freezed,
    Object? pdfFileSize = freezed,
    Object? pdfRef = freezed,
    Object? jsonRef = freezed,
    Object? tocJsonRef = freezed,
  }) {
    return _then(ProtocolBundleAsFirebaseRefs(
      bundleId: bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion: bundleVersion == freezed
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pdfFileSize: pdfFileSize == freezed
          ? _value.pdfFileSize
          : pdfFileSize // ignore: cast_nullable_to_non_nullable
              as int,
      pdfRef: pdfRef == freezed
          ? _value.pdfRef
          : pdfRef // ignore: cast_nullable_to_non_nullable
              as Reference,
      jsonRef: jsonRef == freezed
          ? _value.jsonRef
          : jsonRef // ignore: cast_nullable_to_non_nullable
              as Reference,
      tocJsonRef: tocJsonRef == freezed
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
        (other is ProtocolBundleAsFirebaseRefs &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)) &&
            (identical(other.bundleVersion, bundleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.bundleVersion, bundleVersion)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.pdfFileSize, pdfFileSize) ||
                const DeepCollectionEquality()
                    .equals(other.pdfFileSize, pdfFileSize)) &&
            (identical(other.pdfRef, pdfRef) ||
                const DeepCollectionEquality().equals(other.pdfRef, pdfRef)) &&
            (identical(other.jsonRef, jsonRef) ||
                const DeepCollectionEquality()
                    .equals(other.jsonRef, jsonRef)) &&
            (identical(other.tocJsonRef, tocJsonRef) ||
                const DeepCollectionEquality()
                    .equals(other.tocJsonRef, tocJsonRef)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bundleId) ^
      const DeepCollectionEquality().hash(bundleVersion) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(pdfFileSize) ^
      const DeepCollectionEquality().hash(pdfRef) ^
      const DeepCollectionEquality().hash(jsonRef) ^
      const DeepCollectionEquality().hash(tocJsonRef);

  @JsonKey(ignore: true)
  @override
  $ProtocolBundleAsFirebaseRefsCopyWith<ProtocolBundleAsFirebaseRefs>
      get copyWith => _$ProtocolBundleAsFirebaseRefsCopyWithImpl<
          ProtocolBundleAsFirebaseRefs>(this, _$identity);

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
      {required String bundleId,
      required int bundleVersion,
      required int year,
      required int pdfFileSize,
      required Reference pdfRef,
      required Reference jsonRef,
      required Reference tocJsonRef}) = _$ProtocolBundleAsFirebaseRefs;

  String get bundleId => throw _privateConstructorUsedError;
  int get bundleVersion => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get pdfFileSize => throw _privateConstructorUsedError;
  Reference get pdfRef => throw _privateConstructorUsedError;
  Reference get jsonRef => throw _privateConstructorUsedError;
  Reference get tocJsonRef => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolBundleAsFirebaseRefsCopyWith<ProtocolBundleAsFirebaseRefs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolBundleAsFilesCopyWith<$Res> {
  factory $ProtocolBundleAsFilesCopyWith(ProtocolBundleAsFiles value,
          $Res Function(ProtocolBundleAsFiles) then) =
      _$ProtocolBundleAsFilesCopyWithImpl<$Res>;
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
class _$ProtocolBundleAsFilesCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res>
    implements $ProtocolBundleAsFilesCopyWith<$Res> {
  _$ProtocolBundleAsFilesCopyWithImpl(
      ProtocolBundleAsFiles _value, $Res Function(ProtocolBundleAsFiles) _then)
      : super(_value, (v) => _then(v as ProtocolBundleAsFiles));

  @override
  ProtocolBundleAsFiles get _value => super._value as ProtocolBundleAsFiles;

  @override
  $Res call({
    Object? bundleId = freezed,
    Object? bundleVersion = freezed,
    Object? year = freezed,
    Object? pdfFileSize = freezed,
    Object? pdfFile = freezed,
    Object? jsonFile = freezed,
    Object? tocJsonFile = freezed,
  }) {
    return _then(ProtocolBundleAsFiles(
      bundleId: bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion: bundleVersion == freezed
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pdfFileSize: pdfFileSize == freezed
          ? _value.pdfFileSize
          : pdfFileSize // ignore: cast_nullable_to_non_nullable
              as int,
      pdfFile: pdfFile == freezed
          ? _value.pdfFile
          : pdfFile // ignore: cast_nullable_to_non_nullable
              as File,
      jsonFile: jsonFile == freezed
          ? _value.jsonFile
          : jsonFile // ignore: cast_nullable_to_non_nullable
              as File,
      tocJsonFile: tocJsonFile == freezed
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
        (other is ProtocolBundleAsFiles &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)) &&
            (identical(other.bundleVersion, bundleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.bundleVersion, bundleVersion)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.pdfFileSize, pdfFileSize) ||
                const DeepCollectionEquality()
                    .equals(other.pdfFileSize, pdfFileSize)) &&
            (identical(other.pdfFile, pdfFile) ||
                const DeepCollectionEquality()
                    .equals(other.pdfFile, pdfFile)) &&
            (identical(other.jsonFile, jsonFile) ||
                const DeepCollectionEquality()
                    .equals(other.jsonFile, jsonFile)) &&
            (identical(other.tocJsonFile, tocJsonFile) ||
                const DeepCollectionEquality()
                    .equals(other.tocJsonFile, tocJsonFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bundleId) ^
      const DeepCollectionEquality().hash(bundleVersion) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(pdfFileSize) ^
      const DeepCollectionEquality().hash(pdfFile) ^
      const DeepCollectionEquality().hash(jsonFile) ^
      const DeepCollectionEquality().hash(tocJsonFile);

  @JsonKey(ignore: true)
  @override
  $ProtocolBundleAsFilesCopyWith<ProtocolBundleAsFiles> get copyWith =>
      _$ProtocolBundleAsFilesCopyWithImpl<ProtocolBundleAsFiles>(
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
      {required String bundleId,
      required int bundleVersion,
      required int year,
      required int pdfFileSize,
      required File pdfFile,
      required File jsonFile,
      required File tocJsonFile}) = _$ProtocolBundleAsFiles;

  String get bundleId => throw _privateConstructorUsedError;
  int get bundleVersion => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get pdfFileSize => throw _privateConstructorUsedError;
  File get pdfFile => throw _privateConstructorUsedError;
  File get jsonFile => throw _privateConstructorUsedError;
  File get tocJsonFile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolBundleAsFilesCopyWith<ProtocolBundleAsFiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocoleBundleDownloadingCopyWith<$Res> {
  factory $ProtocoleBundleDownloadingCopyWith(ProtocoleBundleDownloading value,
          $Res Function(ProtocoleBundleDownloading) then) =
      _$ProtocoleBundleDownloadingCopyWithImpl<$Res>;
  $Res call({String bundleId});
}

/// @nodoc
class _$ProtocoleBundleDownloadingCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res>
    implements $ProtocoleBundleDownloadingCopyWith<$Res> {
  _$ProtocoleBundleDownloadingCopyWithImpl(ProtocoleBundleDownloading _value,
      $Res Function(ProtocoleBundleDownloading) _then)
      : super(_value, (v) => _then(v as ProtocoleBundleDownloading));

  @override
  ProtocoleBundleDownloading get _value =>
      super._value as ProtocoleBundleDownloading;

  @override
  $Res call({
    Object? bundleId = freezed,
  }) {
    return _then(ProtocoleBundleDownloading(
      bundleId: bundleId == freezed
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
        (other is ProtocoleBundleDownloading &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bundleId);

  @JsonKey(ignore: true)
  @override
  $ProtocoleBundleDownloadingCopyWith<ProtocoleBundleDownloading>
      get copyWith =>
          _$ProtocoleBundleDownloadingCopyWithImpl<ProtocoleBundleDownloading>(
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
    return downloading(bundleId);
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
  const factory ProtocoleBundleDownloading({required String bundleId}) =
      _$ProtocoleBundleDownloading;

  String get bundleId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocoleBundleDownloadingCopyWith<ProtocoleBundleDownloading>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolBundleLoadingCopyWith<$Res> {
  factory $ProtocolBundleLoadingCopyWith(ProtocolBundleLoading value,
          $Res Function(ProtocolBundleLoading) then) =
      _$ProtocolBundleLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProtocolBundleLoadingCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res>
    implements $ProtocolBundleLoadingCopyWith<$Res> {
  _$ProtocolBundleLoadingCopyWithImpl(
      ProtocolBundleLoading _value, $Res Function(ProtocolBundleLoading) _then)
      : super(_value, (v) => _then(v as ProtocolBundleLoading));

  @override
  ProtocolBundleLoading get _value => super._value as ProtocolBundleLoading;
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
    return identical(this, other) || (other is ProtocolBundleLoading);
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
abstract class $ProtocolBundleErrorCopyWith<$Res> {
  factory $ProtocolBundleErrorCopyWith(
          ProtocolBundleError value, $Res Function(ProtocolBundleError) then) =
      _$ProtocolBundleErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$ProtocolBundleErrorCopyWithImpl<$Res>
    extends _$ProtocolBundleCopyWithImpl<$Res>
    implements $ProtocolBundleErrorCopyWith<$Res> {
  _$ProtocolBundleErrorCopyWithImpl(
      ProtocolBundleError _value, $Res Function(ProtocolBundleError) _then)
      : super(_value, (v) => _then(v as ProtocolBundleError));

  @override
  ProtocolBundleError get _value => super._value as ProtocolBundleError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(ProtocolBundleError(
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
        (other is ProtocolBundleError &&
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
  $ProtocolBundleErrorCopyWith<ProtocolBundleError> get copyWith =>
      _$ProtocolBundleErrorCopyWithImpl<ProtocolBundleError>(this, _$identity);

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
  const factory ProtocolBundleError(Object error, StackTrace stackTrace) =
      _$ProtocolBundleError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolBundleErrorCopyWith<ProtocolBundleError> get copyWith =>
      throw _privateConstructorUsedError;
}
