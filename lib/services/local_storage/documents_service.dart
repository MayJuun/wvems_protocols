import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:wvems_protocols/models/models.dart';

// CRUD operations for all locally stored documents and files
class DocumentsService {
  // Get the app directory
  Future<Directory> getAppDirectory() async =>
      await getApplicationDocumentsDirectory();

  /// List all subdirectories within a single folder
  /// This does not check for subdirectories within a subdirectory (recursive)
  List<Directory> subDirectoriesList(Directory directory) {
    final subDirectoryList = <Directory>[];
    try {
      directory.listSync(recursive: false, followLinks: true).forEach((e) {
        if (e is Directory) {
          subDirectoryList.add(e);
        }
      });
    } catch (error) {
      print('error parsing local file system entity: $error');
    }

    return subDirectoryList;
  }

  /// List all files within a single folder
  List<File> filesList(Directory directory) {
    final filesList = <File>[];
    try {
      directory.listSync(recursive: false, followLinks: true).forEach((e) {
        if (e is File) {
          filesList.add(e);
        }
      });
    } catch (error) {
      print('error parsing local file system entity: $error');
    }
    return filesList;
  }

  int getFileSize(File file) => file.lengthSync();

  Future<bool> removeLocalBundle(ProtocolBundleAsFiles bundle) async {
    late final bool status;

    try {
      final appDirectory = await getAppDirectory();

      final directoryPath =
          Directory('${appDirectory.path}/${bundle.bundleId}');
      print(directoryPath);
      if (directoryPath.existsSync()) {
        directoryPath.deleteSync(recursive: true);
        print('${bundle.bundleId} folder deleted');
        status = true;
      } else {
        print('error: ${bundle.bundleId} is not a directory');
        status = false;
      }
    } catch (error) {
      print('error deleting local bundle: $error');
      status = false;
    }
    return status;
  }
}
