import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/services/services.dart';

/// This controller stores the state of Firebase Authentication
/// It is directly used to manage CloudStorage and Auth functions
/// Each function is 'wrapped' with a check to verify Firebase login status

class FirebaseController extends GetxController {
  final _auth = AuthService();
  final _cloudStorage = CloudStorageService();
  late StreamSubscription<User?> _loginStateSubscription;

  final isLoggedIn = false.obs;

  Future<void> listExample() async =>
      await _checkIfLoggedIn(() => _cloudStorage.listExample());

  // *******************************************************************
  // ******************* GETTERS AND SETTERS ***************************
  // *******************************************************************
  Future<List<Reference>>? getSubDirectoriesIfLoggedIn() async =>
      await _checkIfLoggedIn(() => _cloudStorage.subDirectoriesList());

  Future<List<Reference>>? getFilesIfLoggedIn(Reference reference) async =>
      await _checkIfLoggedIn(() => _cloudStorage.filesList(reference));

  // *******************************************************************
  Future<dynamic> _checkIfLoggedIn(Function function) async {
    // first, try to login
    if (!isLoggedIn.value) {
      await _auth.signInAnonymously();
    }

    // now, if already logged in, fetch list
    // note that if login failed, this will return nothing
    if (isLoggedIn.value) {
      try {
        print('Logged in!');
        return function();
      } catch (error) {
        print(error);
        return null;
      }
    }
  }

  @override
  void onInit() {
    _loginStateSubscription = _auth.authStateStream().listen(
      (User? user) {
        if (user == null) {
          isLoggedIn.value = false;
          print('User is currently signed out!');
        } else {
          isLoggedIn.value = true;
          print('User is signed in!');
        }
      },
    );
    super.onInit();
  }

  @override
  void onClose() {
    _loginStateSubscription.cancel();
    super.onClose();
  }
}
