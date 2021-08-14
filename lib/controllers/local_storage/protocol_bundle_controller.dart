import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/services/services.dart';

import '../controllers.dart';

class ProtocolBundleController extends GetxController {
  final FirebaseController _firebaseController = Get.put(FirebaseController());
  final PdfStateController _pdfStateController = Get.find();
  final DocumentsService _documentsService = DocumentsService();
  final PdfService _pdfService = PdfService();

  ///
  /// Utility classes, used to assist with object conversion and validation
  ///
  final AssetsUtil _assetsUtil = AssetsUtil();
  final BundleValidationUtil _bundleValidationUtil = BundleValidationUtil();
  final DocumentsUtil _documentsUtil = DocumentsUtil();

  late final Directory _appDirectory;

  final RxList<ProtocolBundle> protocolBundleSet = <ProtocolBundle>[].obs;

  List<ProtocolBundleAsFiles> bundleFiles() {
    final list = <ProtocolBundleAsFiles>[];
    protocolBundleSet.forEach(
      (bundle) {
        if (bundle is ProtocolBundleAsFiles) {
          list.add(bundle);
        }
      },
    );
    list.sort((a, b) => b.bundleId.compareTo(a.bundleId));
    return list;
  }

  List<ProtocoleBundleDownloading> bundleFilesDownloading() =>
      protocolBundleSet.whereType<ProtocoleBundleDownloading>().toList();

  List<ProtocolBundleAsFirebaseRefs> bundleFirebaseRefs() {
    final list = <ProtocolBundleAsFirebaseRefs>[];
    protocolBundleSet.forEach(
      (bundle) {
        if (bundle is ProtocolBundleAsFirebaseRefs) {
          list.add(bundle);
        }
      },
    );
    list.sort((a, b) => b.bundleId.compareTo(a.bundleId));
    return list;
  }

  List<ProtocolBundleAsAssets> bundleAssets() {
    final list = <ProtocolBundleAsAssets>[];
    protocolBundleSet.forEach(
      (bundle) {
        if (bundle is ProtocolBundleAsAssets) {
          list.add(bundle);
        }
      },
    );
    list.sort((a, b) => b.bundleId.compareTo(a.bundleId));
    return list;
  }

  bool isBundleIdAnAsset(String bundleId) {
    bool result = false;
    bundleAssets().forEach((bundle) {
      if (bundle.bundleId == bundleId) {
        result = true;
      }
    });
    return result;
  }

  bool isBundleStoredLocally(String bundleIdCheck) {
    bool response = false;
    protocolBundleSet.forEach(
      (bundle) {
        if (bundle is ProtocolBundleAsFiles &&
            bundle.bundleId == bundleIdCheck) {
          response = true;
        }
      },
    );
    return response;
  }

  bool isBundleAvailableOnCloud(String bundleIdCheck) {
    bool response = false;
    protocolBundleSet.forEach(
      (bundle) {
        if (bundle is ProtocolBundleAsFirebaseRefs &&
            bundle.bundleId == bundleIdCheck) {
          response = true;
        }
      },
    );
    return response;
  }

  ///
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

  Future<void> downloadCloudBundle(ProtocolBundleAsFirebaseRefs bundle) async {
    /// setup temporary loading screen to inform user this button has been pressed
    setTemporaryLoading();

    protocolBundleSet.remove(bundle);
    protocolBundleSet
        .add(ProtocolBundle.downloading(bundleId: bundle.bundleId));

    /// download file, then update file list and redraw UI
    await _firebaseController.fetchBundleIfLoggedIn(
        bundle,
        () async => await refreshLocalData().then((value) =>
            Future.delayed(const Duration(seconds: 2)).then((value) =>
                protocolBundleSet.remove(
                    ProtocolBundle.downloading(bundleId: bundle.bundleId)))));
  }

  Future<bool> removeLocalBundle(ProtocolBundleAsFiles bundle) async {
    late final bool result;

    /// if this exists as an asset, do not remove it
    if (isBundleIdAnAsset(bundle.bundleId)) {
      Get.defaultDialog(
        title: 'Cannot remove PDF',
        middleText:
            'This PDF was included in the original app, so it cannot be removed',
        textConfirm: 'OK',
        onConfirm: () {
          Get.back();
        },
      );
    } else {
      result = await _documentsService.removeLocalBundle(bundle);
      if (result) {
        protocolBundleSet.remove(bundle);
        refreshCloudData();
      } else {
        print('unable to remove bundle');
      }
    }

    return result;
  }

  ///
  /// Methods Used to Download or Refresh Data
  /// These methods are optimally called via a command, so that
  /// the UI may remain as disconnected to controllers/services as possible
  ///

  Future<void> setTemporaryLoading() async {
    protocolBundleSet.add(const ProtocolBundle.loading());
    await Future.delayed(const Duration(seconds: 1));
    protocolBundleSet.remove(const ProtocolBundle.loading());
  }

  /// Removes and reloads all cloud files saved in [protocolBundleSet]
  ///
  Future<bool> refreshCloudData() async {
    protocolBundleSet.add(const ProtocolBundle.loading());

    protocolBundleSet.removeWhere((e) => e is ProtocolBundleAsFirebaseRefs);

    await _loadCloudBundles();
    await Future.delayed(const Duration(seconds: 1));

    protocolBundleSet.remove(const ProtocolBundle.loading());
    return true;
  }

  /// Removes and reloads all local files saved in [protocolBundleSet]
  ///
  Future<bool> refreshLocalData() async {
    // protocolBundleSet.clear();
    protocolBundleSet.add(const ProtocolBundle.loading());

    protocolBundleSet.removeWhere((e) => e is ProtocolBundleAsFiles);
    await _loadLocalBundles();
    await Future.delayed(const Duration(milliseconds: 400));

    protocolBundleSet.remove(const ProtocolBundle.loading());
    return true;
  }

  /// Mapping Functions
  ///
  /// These functions typically occur on first load of the app.
  /// They may also occur when the Refresh button is selected
  /// from within the Settings Dialog
  ///

  Future<ProtocolBundleAsFiles> _loadAssetBundles(String appAsset) async {
    late final ProtocolBundleAsFiles result;

    final jsonString =
        await rootBundle.loadString(_assetsUtil.toJsonWithToc(appAsset));
    final tocJsonState =
        await _bundleValidationUtil.loadTocJsonFromJsonString(jsonString);
    final int bundleVersion =
        _bundleValidationUtil.getBundleVersionFromTocJson(tocJsonState);
    final int year = _bundleValidationUtil.getYearFromTocJson(tocJsonState);

    final pdfAssetPath = _assetsUtil.toPdf(appAsset);
    final jsonAssetPath = _assetsUtil.toJson(appAsset);
    final tocJsonAssetPath = _assetsUtil.toJsonWithToc(appAsset);

    try {
      /// create the asset version of this bundle
      final newAppAsset = ProtocolBundle.asAssets(
        bundleId: appAsset,
        bundleVersion: bundleVersion,
        year: year,
        pdfAssetPath: pdfAssetPath,
        jsonAssetPath: jsonAssetPath,
        tocJsonAssetPath: tocJsonAssetPath,
      );

      /// Add app asset to the [protocolBundleSet]
      protocolBundleSet.add(newAppAsset);

      final File pdfFile = await _pdfService.loadFileFromAsset(
          pdfAssetPath, _documentsUtil.toPdf(appAsset));
      final File jsonFile = await _pdfService.loadFileFromAsset(
          jsonAssetPath, _documentsUtil.toJson(appAsset));
      final File tocJsonFile = await _pdfService.loadFileFromAsset(
          tocJsonAssetPath, _documentsUtil.toJsonWithToc(appAsset));

      final pdfFileSize = _documentsService.getFileSize(pdfFile);

      /// Then, convert this asset to a file, if it does not exist already
      result = ProtocolBundleAsFiles(
        bundleId: appAsset,
        bundleVersion: bundleVersion,
        year: year,
        pdfFileSize: pdfFileSize,
        pdfFile: pdfFile,
        jsonFile: jsonFile,
        tocJsonFile: tocJsonFile,
      );
    } catch (error, stackTrace) {
      printError();
      protocolBundleSet.add(ProtocolBundle.error(error, stackTrace));
    }
    return result;
  }

  /// Show all local files and directories
  /// Them proceed to validate each folder for 'bundle' data
  ///
  Future<bool> _loadLocalBundles() async {
    final List<Directory> localDirectories = getLocalSubDirectories();

    localDirectories.forEach((localDirectory) async =>
        await _checkDirectoryForBundleData(localDirectory));
    return true;
  }

  /// The main folder is defined as a [bundleId]
  /// Each file within is loaded into a temporary map for validation.
  /// If validation checks are successful, add them to [protocolBundleSet]
  ///
  Future<bool> _checkDirectoryForBundleData(Directory localDirectory) async {
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
    if (_bundleValidationUtil.doesMapContainAllBundleKeys(bundleId, filesMap)) {
      print('Map for $bundleId VALID:  ${filesMap.keys}');
      await _addFilesMapToBundleList(bundleId, filesMap);
    } else {
      print('Map for $bundleId INVALID:  ${filesMap.keys}');
    }
    return true;
  }

  Future<bool> _addFilesMapToBundleList(
      String bundleId, Map<String, File> filesMap) async {
    late final ProtocolBundle bundleItem;
    try {
      /// First, attempt to load all files from the map
      final File? pdfFile = filesMap[_documentsUtil.toPdf(bundleId)];
      final File? jsonFile = filesMap[_documentsUtil.toJson(bundleId)];
      final File? tocJsonFile =
          filesMap[_documentsUtil.toJsonWithToc(bundleId)];

      if (pdfFile != null && jsonFile != null && tocJsonFile != null) {
        // loop indefinitely if the PDF file size doesn't exist
        while (_documentsService.getFileSize(pdfFile) == 0) {
          await Future.delayed(const Duration(milliseconds: 400));
        }

        /// Read the Table of Contents json to get the bundle version
        final String jsonString = await tocJsonFile.readAsString();
        final PdfTableOfContentsState tocJsonState =
            await _bundleValidationUtil.loadTocJsonFromJsonString(jsonString);
        final int bundleVersion =
            _bundleValidationUtil.getBundleVersionFromTocJson(tocJsonState);

        /// Read Table of Contents json to get year
        final int year = _bundleValidationUtil.getYearFromTocJson(tocJsonState);

        /// Check size of PDF file
        final int pdfFileSize = _documentsService.getFileSize(pdfFile);

        bundleItem = ProtocolBundle.asFiles(
          bundleId: bundleId,
          bundleVersion: bundleVersion,
          year: year,
          pdfFile: pdfFile,
          jsonFile: jsonFile,
          tocJsonFile: tocJsonFile,
          pdfFileSize: pdfFileSize,
        );
      } else {
        throw 'FILE ERROR: Unable to find all Protocol Bundle data';
      }
    } catch (error, stackTrace) {
      printError();
      bundleItem = ProtocolBundle.error(error, stackTrace);
    }
    protocolBundleSet.add(bundleItem);
    return true;
  }

  /// Show all cloud-based files and directories
  /// Them proceed to validate each folder for 'bundle' data
  ///
  Future<bool> _loadCloudBundles() async {
    final cloudDirectories = await getCloudSubDirectories();

    cloudDirectories.forEach(
      (cloudFolderRef) async => await _checkReferenceForBundleData(
        bundleId: cloudFolderRef.fullPath,
        cloudFolderRef: cloudFolderRef,
      ),
    );
    return true;
  }

  /// The main folder is defined as a [bundleId]
  /// Each file within is loaded into a temporary map for validation.
  /// If validation checks are successful, add them to [protocolBundleSet]
  ///
  Future<bool> _checkReferenceForBundleData(
      {required String bundleId, required Reference cloudFolderRef}) async {
    // print('***CLOUD ${cloudFolderRef.fullPath}***');

    /// load all files into temporary list
    final cloudFiles = await getCloudFiles(cloudFolderRef);

    /// create a searchable map, populated with each file reference
    final Map<String, Reference> fileReferenceMap = <String, Reference>{};
    cloudFiles.forEach((cloudFileRef) {
      final cfPath = cloudFileRef.fullPath;

      fileReferenceMap[cfPath] = cloudFileRef;
      // print('file: $cfPath');
    });

    /// check map
    if (_bundleValidationUtil.doesMapContainAllBundleKeys(
        bundleId, fileReferenceMap)) {
      print('Map for $bundleId VALID:  ${fileReferenceMap.keys}');
      await _addFileReferenceMapToBundleList(bundleId, fileReferenceMap);
    } else {
      print('Map for $bundleId INVALID:  ${fileReferenceMap.keys}');
    }
    return true;
  }

  Future<bool> _addFileReferenceMapToBundleList(
      String bundleId, Map<String, Reference> fileReferenceMap) async {
    late final ProtocolBundle bundleItem;
    try {
      /// First, attempt to load all files from the map
      final Reference? pdfRef =
          fileReferenceMap[_documentsUtil.toPdf(bundleId)];
      final Reference? jsonRef =
          fileReferenceMap[_documentsUtil.toJson(bundleId)];
      final Reference? tocJsonRef =
          fileReferenceMap[_documentsUtil.toJsonWithToc(bundleId)];

      if (pdfRef != null && jsonRef != null && tocJsonRef != null) {
        final tocJsonFile =
            await _firebaseController.getTocJsonIfLoggedIn(tocJsonRef) ??
                PdfTableOfContentsState.error(
                    'no cloud TOC Json data', StackTrace.current);

        /// Read the Table of Contents json to get the bundle version
        final int bundleVersion =
            _bundleValidationUtil.getBundleVersionFromTocJson(tocJsonFile);

        /// Read Table of Contents json to get year
        final int year = _bundleValidationUtil.getYearFromTocJson(tocJsonFile);

        // todo: get metadata of pdfRef here
        final int pdfFileSize =
            await _firebaseController.getFileSizeIfLoggedIn(pdfRef) ?? -1;

        bundleItem = ProtocolBundle.asFirebaseRefs(
          bundleId: bundleId,
          bundleVersion: bundleVersion,
          year: year,
          pdfFileSize: pdfFileSize,
          pdfRef: pdfRef,
          jsonRef: jsonRef,
          tocJsonRef: tocJsonRef,
        );
      } else {
        throw 'CLOUD REF ERROR: Unable to find all Protocol Bundle data';
      }
    } catch (error, stackTrace) {
      printError();
      bundleItem = ProtocolBundle.error(error, stackTrace);
    }
    protocolBundleSet.add(bundleItem);
    return true;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _appDirectory = await _documentsService.getAppDirectory();

    /// Convert asset into a Bundle (both as an asset and as a file)
    /// if data do not exist already, save them locally
    final ProtocolBundleAsFiles firstLoadBundle =
        await _loadAssetBundles(AppAssets.PROTOCOL_2021);
    await _pdfStateController.loadNewPdf(firstLoadBundle);

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

    showAppAssets(AppAssets.PROTOCOL_2021);
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
