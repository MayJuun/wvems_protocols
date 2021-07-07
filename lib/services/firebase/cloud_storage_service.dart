import 'package:firebase_storage/firebase_storage.dart';

// Use the Firebase controller to access methods within this service.
class CloudStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> listExample() async {
    final ListResult result = await storage.ref().child('pdf').listAll();
    print('Ready to list examples!');

    result.items.forEach((Reference ref) {
      print('Found file: $ref');
    });

    result.prefixes.forEach((Reference ref) {
      print('Found directory: $ref');
    });
  }
}
