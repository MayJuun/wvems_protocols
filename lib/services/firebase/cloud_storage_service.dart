import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

// Use the Firebase controller to access methods within this service.
class CloudStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> listExample() async {
    final ListResult result = await storage.ref().child('pdf').listAll();
    //Simple Print Statement - Zaps
    print('Ready to list examples!');

    // List of file names
    List pdfFileList = [];

    // Get the app directory
    final directory = await getApplicationDocumentsDirectory();

    // Get pdf filenames
    result.items.forEach((Reference ref) {
      String tmpFileName = ref.fullPath;
      const start = 'pdf/';
      tmpFileName = tmpFileName.substring(start.length);
      tmpFileName = directory.path + '/' + tmpFileName;
      pdfFileList.add(tmpFileName);
    });

    result.prefixes.forEach((Reference ref) {
      print('Found directory: $ref');
    });

    // Get list of items in app directory
    List contents = directory.listSync();

    // Check to see if filenames match contents of app directory
    for (var fileName in pdfFileList) {
      if (contents.contains(fileName)) {
        print('File: ' + fileName + ' is here!');
      } else {
        print('File: ' + fileName + ' is not here!');
      }
    }
  }
}
