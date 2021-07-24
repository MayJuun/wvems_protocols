import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

// Use the Firebase controller to access methods within this service.
class CloudStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> listExample() async {
    // List of items in the storage reference

    final ListResult allFolders = await storage.ref().listAll();

    // PDF Files in Firebase Storage
    final ListResult result = await storage.ref().child('pdf').listAll();

    // JSON Files in Firebase Storage
    final ListResult jsonResult = await storage.ref().child('json').listAll();

    //Simple Print Statement - Zaps
    print('Ready to list examples!');

    // Get the app directory
    final directory = await getApplicationDocumentsDirectory();

    // Get list of items in app directory
    List contents = directory.listSync(recursive: true, followLinks: true);

    // Get pdf filenames
    result.items.forEach((Reference ref) {
      // List Files in Firebase Storage - pdf directory
      String tmpFileName = ref.fullPath;
      print(tmpFileName + ' is available in Firebase Storage');

      // Get filename and alter to match the Application Doc directory
      const start = 'pdf/';
      tmpFileName = tmpFileName.substring(start.length);
      tmpFileName = directory.path + '/' + tmpFileName;

      if (contents.contains(tmpFileName)) {
        print(tmpFileName + ' is here!');
      } else {
        print(tmpFileName + ' is not here!');
        print('Downloading');
        File downloadToFile = File(tmpFileName);
        ref.writeToFile(downloadToFile);
      }
    });

    jsonResult.items.forEach((Reference ref) {
      String tmpJSONFileName = ref.fullPath;
      print(tmpJSONFileName + ' is available in Firebase Storage');

      // Get filename and alter to match the Application Doc directory
      const start = 'json/';
      tmpJSONFileName = tmpJSONFileName.substring(start.length);
      tmpJSONFileName = directory.path + '/' + tmpJSONFileName;
      print(tmpJSONFileName);

      if (contents.contains(tmpJSONFileName)) {
        print(tmpJSONFileName + ' is here!');
      } else {
        print(tmpJSONFileName + ' is not here!');
        print('Downloading');
        File downloadToFile = File(tmpJSONFileName);
        ref.writeToFile(downloadToFile);
      }
    });

    for (var item in contents) {
      print(item);
    }

    result.prefixes.forEach((Reference ref) {
      print('Found directory: $ref');
    });
  }
}
