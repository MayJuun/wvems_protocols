import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/models/protocol_version_bundle/protocol_version_bundle.dart';
import 'package:wvems_protocols/services/documents_service.dart';
import 'package:wvems_protocols/services/services.dart';

import '../controllers.dart';

class ProtocolVersionController extends GetxController {
  final FirebaseController _firebaseController = Get.put(FirebaseController());
  final DocumentsService _documentsService = DocumentsService();
  final DocumentsUtil _documentsUtil = DocumentsUtil();
  final AssetsUtil _assetsUtil = AssetsUtil();
  late final Directory _appDirectory;

  final RxList<ProtocolVersionBundle> protocolBundleList =
      <ProtocolVersionBundle>[].obs;

  /// Custom Getters and Setters
  ///
  /// These methods harness local [DocumentsService] and
  /// cloud [FirebaseController] classes to display the various files
  /// and folders within a specified directory
  ///
  /// Currently, they do not show additional 'subdirectories' recursively
  ///
  /// Methods within [FirebaseController] first check to verify that the
  /// user has been logged in prior to accessing the [CloudStorageService]
  ///
  List<Directory> getLocalSubDirectories() =>
      _documentsService.subDirectoriesList(_appDirectory);

  List<File> getLocalFiles(Directory directory) =>
      _documentsService.filesList(directory);

  Future<List<Reference>> getCloudSubDirectories() async =>
      await _firebaseController.getSubDirectoriesIfLoggedIn() ?? <Reference>[];

  Future<List<Reference>> getCloudFiles(Reference reference) async =>
      await _firebaseController.getFilesIfLoggedIn(reference) ?? <Reference>[];

  ///
  /// Temporary methods used for testing
  ///
  Future<void> _showAllFiles() async {
    final localDirectories = getLocalSubDirectories();

    // show all local files and directories:
    localDirectories.forEach((localDir) {
      final shortPath =
          _documentsUtil.removeAppDirectoryPath(_appDirectory, localDir.path);
      print('****LOCAL DIRECTORY: $shortPath****');
      final localFiles = getLocalFiles(localDir);
      localFiles.forEach((lf) {
        final lfPath =
            _documentsUtil.removeAppDirectoryPath(_appDirectory, lf.path);
        print('file: $lfPath');
      });
    });

    // show all cloud files and directories:
    final cloudDirectories = await getCloudSubDirectories();

    cloudDirectories.forEach(
      (refDir) async {
        final cloudFiles = await getCloudFiles(refDir);
        print('***CLOUD ${refDir.fullPath}***');
        cloudFiles.forEach((cf) => print('file: ${cf.fullPath}'));
      },
    );

    showAppAssets(AppAssets.PROTOCOL_2020);
  }

  // show asset files
  void showAppAssets(String appAsset) {
    print('***APP asset***');
    print(appAsset);
    print(_assetsUtil.toPdf(appAsset));
    print(_assetsUtil.toJson(appAsset));
    print(_assetsUtil.toJsonWithToc(appAsset));
  }

  /// Mapping Functions
  ///
  /// These functions occur on first load of the app
  /// They also occur whenever the Refresh button is selected
  /// from within the Settings Dialog

  void _loadAppAsset(String appAsset) {}

  Future<int> checkJsonForBundleVersion(String assetPath) async {
    var jsonTocState = const PdfTableOfContentsState.loading();
    final ValidatorsUtil validatorsUtil = ValidatorsUtil();

    late final int bundleVersion;
    late final String bundleVersionString;

    /// First, attempt to load the Table of Contents JSON and obtain
    /// the string value assigned to the key 'version'.
    /// This should be an integer referencing the bundle's current version.
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> textList = jsonDecode(jsonString);

      jsonTocState = PdfTableOfContentsState.data(textList);
      print('Temporary json TOC loaded');

      /// set bundleVersion as a string variable
      bundleVersionString = textList['version'] ?? '';
    } catch (e, st) {
      print('error checking JSON for bundle version: $e');
      jsonTocState = PdfTableOfContentsState.error(e, st);
    }

    /// Only attempt to decode bundleVersionString if the JSON was successfully loaded
    if (jsonTocState is PdfTableOfContentsStateData) {
      bundleVersion = validatorsUtil.isValidInteger(bundleVersionString)
          ? validatorsUtil.stringToInt(bundleVersionString)
          : -1;
    } else {
      bundleVersion = -1;
    }
    print('Asset: $assetPath, Bundle #: $bundleVersion');

    /// Bundle versions retruned as -1 occur if integer is invalid, is NAN, or if null.
    /// It also returns as -1 if any errors occurred loading the Table of Contents JSON.
    return bundleVersion;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _appDirectory = await _documentsService.getAppDirectory();
  }
}
