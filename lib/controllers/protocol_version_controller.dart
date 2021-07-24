import 'dart:io';

import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/models/protocol_version_bundle/protocol_version_bundle.dart';
import 'package:wvems_protocols/services/documents_service.dart';

import 'controllers.dart';

class ProtocolVersionController extends GetxController {
  final FirebaseController _firebaseController = Get.find();
  final DocumentsService _documentsService = DocumentsService();
  final DocumentsUtil _documentsUtil = DocumentsUtil();
  late final Directory _appDirectory;

  final RxList<ProtocolVersionBundle> protocolBundleList =
      <ProtocolVersionBundle>[].obs;

  // *******************************************************************
  // ******************* GETTERS AND SETTERS ***************************
  // *******************************************************************
  List<Directory> getLocalSubDirectories() =>
      _documentsService.subDirectoriesList(_appDirectory);

  List<File> getLocalFiles() => _documentsService.filesList(_appDirectory);

  // *******************************************************************
  // ******** MAPPING FUNCTIONS, ON FIRST LOAD OF CONTROLLER ********
  // *******************************************************************

  void testMethod() {
    final _allFilesList = getLocalFiles();

    final filePaths = <String>[];
    _allFilesList.forEach((e) {
      filePaths.add(
        _documentsUtil.removeAppDirectoryPath(_appDirectory, e.path),
      );
    });
    print('allPaths: $filePaths');
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _appDirectory = await _documentsService.getAppDirectory();
  }
}
