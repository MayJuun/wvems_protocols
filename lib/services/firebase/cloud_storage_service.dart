import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/models/models.dart';

// Use the Firebase controller to access methods within this service.
class CloudStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<PdfTableOfContentsState> fetchTocJsonFromReference(
      Reference reference) async {
    late final PdfTableOfContentsState tocJsonState;

    // final download = await reference.getData();

    final downloadUrl = await reference.getDownloadURL();
    final response = await http.get(Uri.parse(downloadUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      tocJsonState =
          await BundleValidationUtil().loadTocJsonFromJsonString(response.body);
      // return _bundleValidationUtil.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load JSON from Firebase');
      // tocJsonState = PdfTableOfContentsState.error(error, stackTrace);
    }
    return tocJsonState;
  }

  /// List all subdirectories within the main folder
  /// This does not check for subdirectories within a subdirectory (recursive)
  Future<List<Reference>> subDirectoriesList() async {
    late final List<Reference> subDirectoriesRef;

    try {
      final ListResult firebaseRefList = await storage.ref().listAll();
      subDirectoriesRef = firebaseRefList.prefixes;
    } catch (error) {
      print('error parsing Firebase storage subdirectories: $error');
      subDirectoriesRef = [];
    }

    return subDirectoriesRef;
  }

  /// List all files within a single folder
  Future<List<Reference>> filesList(Reference reference) async {
    final filesList = <Reference>[];
    try {
      final allFiles = await reference.listAll();
      allFiles.items.forEach((e) => filesList.add(e));
    } catch (error) {
      print('error parsing Firebase storage files: $error');
    }
    return filesList;
  }

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
