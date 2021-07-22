import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

// Use the Firebase controller to access methods within this service.
class CloudStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> listExample() async {
    // List of items in the storage reference
    final ListResult result = await storage.ref().child('pdf').listAll();

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

      // Download files anyway (force for testing)

      // Get filename and alter to match the Application Doc directory
      const start = 'pdf/';
      tmpFileName = tmpFileName.substring(start.length);
      tmpFileName = directory.path + '/' + tmpFileName;
      //print(tmpFileName);

      if (contents.contains(tmpFileName)) {
        print('Here!');
      } else {
          print('Not Here!');
          print('Downloading');
          File downloadToFile = File(tmpFileName);
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
