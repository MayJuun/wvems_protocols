// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'protocol_version_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProtocolVersionBundleTearOff {
  const _$ProtocolVersionBundleTearOff();

  ProtocolVersionBundleAsAssets asAssets(String bundleId, int bundleVersion,
      String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath) {
    return ProtocolVersionBundleAsAssets(
      bundleId,
      bundleVersion,
      pdfAssetPath,
      jsonAssetPath,
      tocJsonAssetPath,
    );
  }

  ProtocolVersionBundleAsFirebaseRefs asFirebaseRefs(
      String bundleId,
      int bundleVersion,
      Reference pdfRef,
      Reference jsonRef,
      Reference tocJsonRef) {
    return ProtocolVersionBundleAsFirebaseRefs(
      bundleId,
      bundleVersion,
      pdfRef,
      jsonRef,
      tocJsonRef,
    );
  }

  ProtocolVersionBundleAsFiles asFiles(String bundleId, int bundleVersion,
      File pdfFile, File jsonFile, File tocJsonFile) {
    return ProtocolVersionBundleAsFiles(
      bundleId,
      bundleVersion,
      pdfFile,
      jsonFile,
      tocJsonFile,
    );
  }

  ProtocolVersionBundleLoading loading() {
    return const ProtocolVersionBundleLoading();
  }

  ProtocolVersionBundleError error(Object error, StackTrace stackTrace) {
    return ProtocolVersionBundleError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $ProtocolVersionBundle = _$ProtocolVersionBundleTearOff();

/// @nodoc
mixin _$ProtocolVersionBundle {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(String bundleId, int bundleVersion,
            Reference pdfRef, Reference jsonRef, Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, String pdfAssetPath,
            String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(String bundleId, int bundleVersion, Reference pdfRef,
            Reference jsonRef, Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolVersionBundleAsAssets value) asAssets,
    required TResult Function(ProtocolVersionBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolVersionBundleAsFiles value) asFiles,
    required TResult Function(ProtocolVersionBundleLoading value) loading,
    required TResult Function(ProtocolVersionBundleError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolVersionBundleAsAssets value)? asAssets,
    TResult Function(ProtocolVersionBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolVersionBundleAsFiles value)? asFiles,
    TResult Function(ProtocolVersionBundleLoading value)? loading,
    TResult Function(ProtocolVersionBundleError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolVersionBundleCopyWith<$Res> {
  factory $ProtocolVersionBundleCopyWith(ProtocolVersionBundle value,
          $Res Function(ProtocolVersionBundle) then) =
      _$ProtocolVersionBundleCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProtocolVersionBundleCopyWithImpl<$Res>
    implements $ProtocolVersionBundleCopyWith<$Res> {
  _$ProtocolVersionBundleCopyWithImpl(this._value, this._then);

  final ProtocolVersionBundle _value;
  // ignore: unused_field
  final $Res Function(ProtocolVersionBundle) _then;
}

/// @nodoc
abstract class $ProtocolVersionBundleAsAssetsCopyWith<$Res> {
  factory $ProtocolVersionBundleAsAssetsCopyWith(
          ProtocolVersionBundleAsAssets value,
          $Res Function(ProtocolVersionBundleAsAssets) then) =
      _$ProtocolVersionBundleAsAssetsCopyWithImpl<$Res>;
  $Res call(
      {String bundleId,
      int bundleVersion,
      String pdfAssetPath,
      String jsonAssetPath,
      String tocJsonAssetPath});
}

/// @nodoc
class _$ProtocolVersionBundleAsAssetsCopyWithImpl<$Res>
    extends _$ProtocolVersionBundleCopyWithImpl<$Res>
    implements $ProtocolVersionBundleAsAssetsCopyWith<$Res> {
  _$ProtocolVersionBundleAsAssetsCopyWithImpl(
      ProtocolVersionBundleAsAssets _value,
      $Res Function(ProtocolVersionBundleAsAssets) _then)
      : super(_value, (v) => _then(v as ProtocolVersionBundleAsAssets));

  @override
  ProtocolVersionBundleAsAssets get _value =>
      super._value as ProtocolVersionBundleAsAssets;

  @override
  $Res call({
    Object? bundleId = freezed,
    Object? bundleVersion = freezed,
    Object? pdfAssetPath = freezed,
    Object? jsonAssetPath = freezed,
    Object? tocJsonAssetPath = freezed,
  }) {
    return _then(ProtocolVersionBundleAsAssets(
      bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion == freezed
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      pdfAssetPath == freezed
          ? _value.pdfAssetPath
          : pdfAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      jsonAssetPath == freezed
          ? _value.jsonAssetPath
          : jsonAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      tocJsonAssetPath == freezed
          ? _value.tocJsonAssetPath
          : tocJsonAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$ProtocolVersionBundleAsAssets implements ProtocolVersionBundleAsAssets {
  const _$ProtocolVersionBundleAsAssets(this.bundleId, this.bundleVersion,
      this.pdfAssetPath, this.jsonAssetPath, this.tocJsonAssetPath);

  @override
  final String bundleId;
  @override
  final int bundleVersion;
  @override
  final String pdfAssetPath;
  @override
  final String jsonAssetPath;
  @override
  final String tocJsonAssetPath;

  @override
  String toString() {
    return 'ProtocolVersionBundle.asAssets(bundleId: $bundleId, bundleVersion: $bundleVersion, pdfAssetPath: $pdfAssetPath, jsonAssetPath: $jsonAssetPath, tocJsonAssetPath: $tocJsonAssetPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProtocolVersionBundleAsAssets &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)) &&
            (identical(other.bundleVersion, bundleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.bundleVersion, bundleVersion)) &&
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
      const DeepCollectionEquality().hash(pdfAssetPath) ^
      const DeepCollectionEquality().hash(jsonAssetPath) ^
      const DeepCollectionEquality().hash(tocJsonAssetPath);

  @JsonKey(ignore: true)
  @override
  $ProtocolVersionBundleAsAssetsCopyWith<ProtocolVersionBundleAsAssets>
      get copyWith => _$ProtocolVersionBundleAsAssetsCopyWithImpl<
          ProtocolVersionBundleAsAssets>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(String bundleId, int bundleVersion,
            Reference pdfRef, Reference jsonRef, Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return asAssets(
        bundleId, bundleVersion, pdfAssetPath, jsonAssetPath, tocJsonAssetPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, String pdfAssetPath,
            String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(String bundleId, int bundleVersion, Reference pdfRef,
            Reference jsonRef, Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (asAssets != null) {
      return asAssets(bundleId, bundleVersion, pdfAssetPath, jsonAssetPath,
          tocJsonAssetPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolVersionBundleAsAssets value) asAssets,
    required TResult Function(ProtocolVersionBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolVersionBundleAsFiles value) asFiles,
    required TResult Function(ProtocolVersionBundleLoading value) loading,
    required TResult Function(ProtocolVersionBundleError value) error,
  }) {
    return asAssets(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolVersionBundleAsAssets value)? asAssets,
    TResult Function(ProtocolVersionBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolVersionBundleAsFiles value)? asFiles,
    TResult Function(ProtocolVersionBundleLoading value)? loading,
    TResult Function(ProtocolVersionBundleError value)? error,
    required TResult orElse(),
  }) {
    if (asAssets != null) {
      return asAssets(this);
    }
    return orElse();
  }
}

abstract class ProtocolVersionBundleAsAssets implements ProtocolVersionBundle {
  const factory ProtocolVersionBundleAsAssets(
      String bundleId,
      int bundleVersion,
      String pdfAssetPath,
      String jsonAssetPath,
      String tocJsonAssetPath) = _$ProtocolVersionBundleAsAssets;

  String get bundleId => throw _privateConstructorUsedError;
  int get bundleVersion => throw _privateConstructorUsedError;
  String get pdfAssetPath => throw _privateConstructorUsedError;
  String get jsonAssetPath => throw _privateConstructorUsedError;
  String get tocJsonAssetPath => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolVersionBundleAsAssetsCopyWith<ProtocolVersionBundleAsAssets>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolVersionBundleAsFirebaseRefsCopyWith<$Res> {
  factory $ProtocolVersionBundleAsFirebaseRefsCopyWith(
          ProtocolVersionBundleAsFirebaseRefs value,
          $Res Function(ProtocolVersionBundleAsFirebaseRefs) then) =
      _$ProtocolVersionBundleAsFirebaseRefsCopyWithImpl<$Res>;
  $Res call(
      {String bundleId,
      int bundleVersion,
      Reference pdfRef,
      Reference jsonRef,
      Reference tocJsonRef});
}

/// @nodoc
class _$ProtocolVersionBundleAsFirebaseRefsCopyWithImpl<$Res>
    extends _$ProtocolVersionBundleCopyWithImpl<$Res>
    implements $ProtocolVersionBundleAsFirebaseRefsCopyWith<$Res> {
  _$ProtocolVersionBundleAsFirebaseRefsCopyWithImpl(
      ProtocolVersionBundleAsFirebaseRefs _value,
      $Res Function(ProtocolVersionBundleAsFirebaseRefs) _then)
      : super(_value, (v) => _then(v as ProtocolVersionBundleAsFirebaseRefs));

  @override
  ProtocolVersionBundleAsFirebaseRefs get _value =>
      super._value as ProtocolVersionBundleAsFirebaseRefs;

  @override
  $Res call({
    Object? bundleId = freezed,
    Object? bundleVersion = freezed,
    Object? pdfRef = freezed,
    Object? jsonRef = freezed,
    Object? tocJsonRef = freezed,
  }) {
    return _then(ProtocolVersionBundleAsFirebaseRefs(
      bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion == freezed
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      pdfRef == freezed
          ? _value.pdfRef
          : pdfRef // ignore: cast_nullable_to_non_nullable
              as Reference,
      jsonRef == freezed
          ? _value.jsonRef
          : jsonRef // ignore: cast_nullable_to_non_nullable
              as Reference,
      tocJsonRef == freezed
          ? _value.tocJsonRef
          : tocJsonRef // ignore: cast_nullable_to_non_nullable
              as Reference,
    ));
  }
}

/// @nodoc
class _$ProtocolVersionBundleAsFirebaseRefs
    implements ProtocolVersionBundleAsFirebaseRefs {
  const _$ProtocolVersionBundleAsFirebaseRefs(this.bundleId, this.bundleVersion,
      this.pdfRef, this.jsonRef, this.tocJsonRef);

  @override
  final String bundleId;
  @override
  final int bundleVersion;
  @override
  final Reference pdfRef;
  @override
  final Reference jsonRef;
  @override
  final Reference tocJsonRef;

  @override
  String toString() {
    return 'ProtocolVersionBundle.asFirebaseRefs(bundleId: $bundleId, bundleVersion: $bundleVersion, pdfRef: $pdfRef, jsonRef: $jsonRef, tocJsonRef: $tocJsonRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProtocolVersionBundleAsFirebaseRefs &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)) &&
            (identical(other.bundleVersion, bundleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.bundleVersion, bundleVersion)) &&
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
      const DeepCollectionEquality().hash(pdfRef) ^
      const DeepCollectionEquality().hash(jsonRef) ^
      const DeepCollectionEquality().hash(tocJsonRef);

  @JsonKey(ignore: true)
  @override
  $ProtocolVersionBundleAsFirebaseRefsCopyWith<
          ProtocolVersionBundleAsFirebaseRefs>
      get copyWith => _$ProtocolVersionBundleAsFirebaseRefsCopyWithImpl<
          ProtocolVersionBundleAsFirebaseRefs>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(String bundleId, int bundleVersion,
            Reference pdfRef, Reference jsonRef, Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return asFirebaseRefs(bundleId, bundleVersion, pdfRef, jsonRef, tocJsonRef);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, String pdfAssetPath,
            String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(String bundleId, int bundleVersion, Reference pdfRef,
            Reference jsonRef, Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (asFirebaseRefs != null) {
      return asFirebaseRefs(
          bundleId, bundleVersion, pdfRef, jsonRef, tocJsonRef);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolVersionBundleAsAssets value) asAssets,
    required TResult Function(ProtocolVersionBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolVersionBundleAsFiles value) asFiles,
    required TResult Function(ProtocolVersionBundleLoading value) loading,
    required TResult Function(ProtocolVersionBundleError value) error,
  }) {
    return asFirebaseRefs(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolVersionBundleAsAssets value)? asAssets,
    TResult Function(ProtocolVersionBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolVersionBundleAsFiles value)? asFiles,
    TResult Function(ProtocolVersionBundleLoading value)? loading,
    TResult Function(ProtocolVersionBundleError value)? error,
    required TResult orElse(),
  }) {
    if (asFirebaseRefs != null) {
      return asFirebaseRefs(this);
    }
    return orElse();
  }
}

abstract class ProtocolVersionBundleAsFirebaseRefs
    implements ProtocolVersionBundle {
  const factory ProtocolVersionBundleAsFirebaseRefs(
      String bundleId,
      int bundleVersion,
      Reference pdfRef,
      Reference jsonRef,
      Reference tocJsonRef) = _$ProtocolVersionBundleAsFirebaseRefs;

  String get bundleId => throw _privateConstructorUsedError;
  int get bundleVersion => throw _privateConstructorUsedError;
  Reference get pdfRef => throw _privateConstructorUsedError;
  Reference get jsonRef => throw _privateConstructorUsedError;
  Reference get tocJsonRef => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolVersionBundleAsFirebaseRefsCopyWith<
          ProtocolVersionBundleAsFirebaseRefs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolVersionBundleAsFilesCopyWith<$Res> {
  factory $ProtocolVersionBundleAsFilesCopyWith(
          ProtocolVersionBundleAsFiles value,
          $Res Function(ProtocolVersionBundleAsFiles) then) =
      _$ProtocolVersionBundleAsFilesCopyWithImpl<$Res>;
  $Res call(
      {String bundleId,
      int bundleVersion,
      File pdfFile,
      File jsonFile,
      File tocJsonFile});
}

/// @nodoc
class _$ProtocolVersionBundleAsFilesCopyWithImpl<$Res>
    extends _$ProtocolVersionBundleCopyWithImpl<$Res>
    implements $ProtocolVersionBundleAsFilesCopyWith<$Res> {
  _$ProtocolVersionBundleAsFilesCopyWithImpl(
      ProtocolVersionBundleAsFiles _value,
      $Res Function(ProtocolVersionBundleAsFiles) _then)
      : super(_value, (v) => _then(v as ProtocolVersionBundleAsFiles));

  @override
  ProtocolVersionBundleAsFiles get _value =>
      super._value as ProtocolVersionBundleAsFiles;

  @override
  $Res call({
    Object? bundleId = freezed,
    Object? bundleVersion = freezed,
    Object? pdfFile = freezed,
    Object? jsonFile = freezed,
    Object? tocJsonFile = freezed,
  }) {
    return _then(ProtocolVersionBundleAsFiles(
      bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as String,
      bundleVersion == freezed
          ? _value.bundleVersion
          : bundleVersion // ignore: cast_nullable_to_non_nullable
              as int,
      pdfFile == freezed
          ? _value.pdfFile
          : pdfFile // ignore: cast_nullable_to_non_nullable
              as File,
      jsonFile == freezed
          ? _value.jsonFile
          : jsonFile // ignore: cast_nullable_to_non_nullable
              as File,
      tocJsonFile == freezed
          ? _value.tocJsonFile
          : tocJsonFile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc
class _$ProtocolVersionBundleAsFiles implements ProtocolVersionBundleAsFiles {
  const _$ProtocolVersionBundleAsFiles(this.bundleId, this.bundleVersion,
      this.pdfFile, this.jsonFile, this.tocJsonFile);

  @override
  final String bundleId;
  @override
  final int bundleVersion;
  @override
  final File pdfFile;
  @override
  final File jsonFile;
  @override
  final File tocJsonFile;

  @override
  String toString() {
    return 'ProtocolVersionBundle.asFiles(bundleId: $bundleId, bundleVersion: $bundleVersion, pdfFile: $pdfFile, jsonFile: $jsonFile, tocJsonFile: $tocJsonFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProtocolVersionBundleAsFiles &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)) &&
            (identical(other.bundleVersion, bundleVersion) ||
                const DeepCollectionEquality()
                    .equals(other.bundleVersion, bundleVersion)) &&
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
      const DeepCollectionEquality().hash(pdfFile) ^
      const DeepCollectionEquality().hash(jsonFile) ^
      const DeepCollectionEquality().hash(tocJsonFile);

  @JsonKey(ignore: true)
  @override
  $ProtocolVersionBundleAsFilesCopyWith<ProtocolVersionBundleAsFiles>
      get copyWith => _$ProtocolVersionBundleAsFilesCopyWithImpl<
          ProtocolVersionBundleAsFiles>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(String bundleId, int bundleVersion,
            Reference pdfRef, Reference jsonRef, Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return asFiles(bundleId, bundleVersion, pdfFile, jsonFile, tocJsonFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, String pdfAssetPath,
            String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(String bundleId, int bundleVersion, Reference pdfRef,
            Reference jsonRef, Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)?
        asFiles,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (asFiles != null) {
      return asFiles(bundleId, bundleVersion, pdfFile, jsonFile, tocJsonFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProtocolVersionBundleAsAssets value) asAssets,
    required TResult Function(ProtocolVersionBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolVersionBundleAsFiles value) asFiles,
    required TResult Function(ProtocolVersionBundleLoading value) loading,
    required TResult Function(ProtocolVersionBundleError value) error,
  }) {
    return asFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolVersionBundleAsAssets value)? asAssets,
    TResult Function(ProtocolVersionBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolVersionBundleAsFiles value)? asFiles,
    TResult Function(ProtocolVersionBundleLoading value)? loading,
    TResult Function(ProtocolVersionBundleError value)? error,
    required TResult orElse(),
  }) {
    if (asFiles != null) {
      return asFiles(this);
    }
    return orElse();
  }
}

abstract class ProtocolVersionBundleAsFiles implements ProtocolVersionBundle {
  const factory ProtocolVersionBundleAsFiles(
      String bundleId,
      int bundleVersion,
      File pdfFile,
      File jsonFile,
      File tocJsonFile) = _$ProtocolVersionBundleAsFiles;

  String get bundleId => throw _privateConstructorUsedError;
  int get bundleVersion => throw _privateConstructorUsedError;
  File get pdfFile => throw _privateConstructorUsedError;
  File get jsonFile => throw _privateConstructorUsedError;
  File get tocJsonFile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolVersionBundleAsFilesCopyWith<ProtocolVersionBundleAsFiles>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolVersionBundleLoadingCopyWith<$Res> {
  factory $ProtocolVersionBundleLoadingCopyWith(
          ProtocolVersionBundleLoading value,
          $Res Function(ProtocolVersionBundleLoading) then) =
      _$ProtocolVersionBundleLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProtocolVersionBundleLoadingCopyWithImpl<$Res>
    extends _$ProtocolVersionBundleCopyWithImpl<$Res>
    implements $ProtocolVersionBundleLoadingCopyWith<$Res> {
  _$ProtocolVersionBundleLoadingCopyWithImpl(
      ProtocolVersionBundleLoading _value,
      $Res Function(ProtocolVersionBundleLoading) _then)
      : super(_value, (v) => _then(v as ProtocolVersionBundleLoading));

  @override
  ProtocolVersionBundleLoading get _value =>
      super._value as ProtocolVersionBundleLoading;
}

/// @nodoc
class _$ProtocolVersionBundleLoading implements ProtocolVersionBundleLoading {
  const _$ProtocolVersionBundleLoading();

  @override
  String toString() {
    return 'ProtocolVersionBundle.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProtocolVersionBundleLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(String bundleId, int bundleVersion,
            Reference pdfRef, Reference jsonRef, Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, String pdfAssetPath,
            String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(String bundleId, int bundleVersion, Reference pdfRef,
            Reference jsonRef, Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)?
        asFiles,
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
    required TResult Function(ProtocolVersionBundleAsAssets value) asAssets,
    required TResult Function(ProtocolVersionBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolVersionBundleAsFiles value) asFiles,
    required TResult Function(ProtocolVersionBundleLoading value) loading,
    required TResult Function(ProtocolVersionBundleError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolVersionBundleAsAssets value)? asAssets,
    TResult Function(ProtocolVersionBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolVersionBundleAsFiles value)? asFiles,
    TResult Function(ProtocolVersionBundleLoading value)? loading,
    TResult Function(ProtocolVersionBundleError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProtocolVersionBundleLoading implements ProtocolVersionBundle {
  const factory ProtocolVersionBundleLoading() = _$ProtocolVersionBundleLoading;
}

/// @nodoc
abstract class $ProtocolVersionBundleErrorCopyWith<$Res> {
  factory $ProtocolVersionBundleErrorCopyWith(ProtocolVersionBundleError value,
          $Res Function(ProtocolVersionBundleError) then) =
      _$ProtocolVersionBundleErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$ProtocolVersionBundleErrorCopyWithImpl<$Res>
    extends _$ProtocolVersionBundleCopyWithImpl<$Res>
    implements $ProtocolVersionBundleErrorCopyWith<$Res> {
  _$ProtocolVersionBundleErrorCopyWithImpl(ProtocolVersionBundleError _value,
      $Res Function(ProtocolVersionBundleError) _then)
      : super(_value, (v) => _then(v as ProtocolVersionBundleError));

  @override
  ProtocolVersionBundleError get _value =>
      super._value as ProtocolVersionBundleError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(ProtocolVersionBundleError(
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
class _$ProtocolVersionBundleError implements ProtocolVersionBundleError {
  const _$ProtocolVersionBundleError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ProtocolVersionBundle.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProtocolVersionBundleError &&
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
  $ProtocolVersionBundleErrorCopyWith<ProtocolVersionBundleError>
      get copyWith =>
          _$ProtocolVersionBundleErrorCopyWithImpl<ProtocolVersionBundleError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bundleId, int bundleVersion,
            String pdfAssetPath, String jsonAssetPath, String tocJsonAssetPath)
        asAssets,
    required TResult Function(String bundleId, int bundleVersion,
            Reference pdfRef, Reference jsonRef, Reference tocJsonRef)
        asFirebaseRefs,
    required TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)
        asFiles,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bundleId, int bundleVersion, String pdfAssetPath,
            String jsonAssetPath, String tocJsonAssetPath)?
        asAssets,
    TResult Function(String bundleId, int bundleVersion, Reference pdfRef,
            Reference jsonRef, Reference tocJsonRef)?
        asFirebaseRefs,
    TResult Function(String bundleId, int bundleVersion, File pdfFile,
            File jsonFile, File tocJsonFile)?
        asFiles,
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
    required TResult Function(ProtocolVersionBundleAsAssets value) asAssets,
    required TResult Function(ProtocolVersionBundleAsFirebaseRefs value)
        asFirebaseRefs,
    required TResult Function(ProtocolVersionBundleAsFiles value) asFiles,
    required TResult Function(ProtocolVersionBundleLoading value) loading,
    required TResult Function(ProtocolVersionBundleError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProtocolVersionBundleAsAssets value)? asAssets,
    TResult Function(ProtocolVersionBundleAsFirebaseRefs value)? asFirebaseRefs,
    TResult Function(ProtocolVersionBundleAsFiles value)? asFiles,
    TResult Function(ProtocolVersionBundleLoading value)? loading,
    TResult Function(ProtocolVersionBundleError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProtocolVersionBundleError implements ProtocolVersionBundle {
  const factory ProtocolVersionBundleError(
      Object error, StackTrace stackTrace) = _$ProtocolVersionBundleError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtocolVersionBundleErrorCopyWith<ProtocolVersionBundleError>
      get copyWith => throw _privateConstructorUsedError;
}
