import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/services/services.dart';

class FirebaseController extends GetxController {
  final _auth = AuthService();
  final _cloudStorage = CloudStorageService();
  late StreamSubscription<User?> _loginStateSubscription;

  final isLoggedIn = false.obs;

  Future<void> getListExample() async {
    // first, try to login
    if (!isLoggedIn.value) {
      await _auth.signInAnonymously();
    }

    // now, if already logged in, fetch list
    // note that if login failed, this will return nothing
    if (isLoggedIn.value) {
      try {
        print('Logged in!');
        _cloudStorage.listExample();
      } catch (error) {
        print(error);
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
