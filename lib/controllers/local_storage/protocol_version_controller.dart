import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/models/protocol_version_bundle/protocol_version_bundle.dart';
import 'package:wvems_protocols/services/documents_service.dart';
import 'package:wvems_protocols/services/services.dart';

import '../controllers.dart';

class ProtocolVersionController extends GetxController {
  final FirebaseController _firebaseController = Get.put(FirebaseController());
  final DocumentsService _documentsService = DocumentsService();

  /// Utility classes, used to assist with object conversion and validation
  ///
  final AssetsUtil _assetsUtil = AssetsUtil();
  final BundleValidationUtil _bundleValidationUtil = BundleValidationUtil();
  final DocumentsUtil _documentsUtil = DocumentsUtil();

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

  /// Mapping Functions
  ///
  /// These functions typically occur on first load of the app.
  /// They may also occur when the Refresh button is selected
  /// from within the Settings Dialog
  ///
  Future<void> _loadAssetBundles(String appAsset) async {
    final jsonString =
        await rootBundle.loadString(_assetsUtil.toJsonWithToc(appAsset));
    final tocJsonState =
        await _bundleValidationUtil.loadTocJsonFromJsonString(jsonString);
    final int bundleVersion =
        _bundleValidationUtil.getBundleVersionFromTocJson(tocJsonState);
    final pdfAssetPath = _assetsUtil.toPdf(appAsset);
    final jsonAssetPath = _assetsUtil.toJson(appAsset);
    final tocJsonAssetPath = _assetsUtil.toJsonWithToc(appAsset);

    try {
      protocolBundleList.add(ProtocolVersionBundle.asAssets(appAsset,
          bundleVersion, pdfAssetPath, jsonAssetPath, tocJsonAssetPath));
    } catch (error, stackTrace) {
      printError();
      protocolBundleList.add(ProtocolVersionBundle.error(error, stackTrace));
    }
  }

  /// Show all local files and directories
  /// Them proceed to validate each folder for 'bundle' data
  ///
  Future<void> _loadLocalBundles() async {
    final localDirectories = getLocalSubDirectories();

    localDirectories.forEach(
        (localDirectory) => _checkDirectoryForBundleData(localDirectory));
  }

  /// The main folder is defined as a [bundleId]
  /// Each file within is loaded into a temporary map for validation.
  /// If validation checks are successful, add them to [protocolBundleList]
  ///
  void _checkDirectoryForBundleData(Directory localDirectory) {
    final bundleId = _documentsUtil.removeAppDirectoryPath(
        _appDirectory, localDirectory.path);
    // print('****LOCAL DIRECTORY: $bundleId****');

    /// load all files into temporary list
    final localFiles = getLocalFiles(localDirectory);

    /// create a searchable map, populated with each file reference
    final Map<String, File> filesMap = <String, File>{};
    localFiles.forEach((localFile) {
      final lfPath =
          _documentsUtil.removeAppDirectoryPath(_appDirectory, localFile.path);
      filesMap[lfPath] = localFile;
      // print('file: $lfPath');
    });

    /// check map
    if (_bundleValidationUtil.doesMapContainAllFiles(bundleId, filesMap)) {
      print('Map for $bundleId VALID:  ${filesMap.keys}');
      _addFilesMapToBundleList(bundleId, filesMap);
    } else {
      print('Map for $bundleId INVALID:  ${filesMap.keys}');
    }
  }

  Future<void> _addFilesMapToBundleList(
      String bundleId, Map<String, File> filesMap) async {
    late final ProtocolVersionBundle bundleItem;
    try {
      /// First, attempt to load all files from the map
      final pdfFile = filesMap[_documentsUtil.toPdf(bundleId)] ?? File('');
      final jsonFile = filesMap[_documentsUtil.toJson(bundleId)] ?? File('');
      final tocJsonFile =
          filesMap[_documentsUtil.toJsonWithToc(bundleId)] ?? File('');

      /// Then, read the Table of Contents json to get the bundle version
      final jsonString = await tocJsonFile.readAsString();
      final tocJsonState =
          await _bundleValidationUtil.loadTocJsonFromJsonString(jsonString);
      final int bundleVersion =
          _bundleValidationUtil.getBundleVersionFromTocJson(tocJsonState);

      bundleItem = ProtocolVersionBundle.asFiles(
          bundleId, bundleVersion, pdfFile, jsonFile, tocJsonFile);
    } catch (error, stackTrace) {
      printError();
      bundleItem = ProtocolVersionBundle.error(error, stackTrace);
    }
    protocolBundleList.add(bundleItem);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _appDirectory = await _documentsService.getAppDirectory();
    await _loadAssetBundles(AppAssets.PROTOCOL_2020);
    await _loadLocalBundles();
  }

  /// Temporary methods used only for testing and to verify files are
  /// displayed/formatted similarly across locations.
  /// Possible locations include hard-coded assets, local files, and cloud
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
}
