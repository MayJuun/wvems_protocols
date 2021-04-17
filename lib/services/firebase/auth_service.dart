import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  Stream<User?> authStateStream() => _auth.authStateChanges();

  Future<UserCredential> signInAnonymously() async =>
      await _auth.signInAnonymously();

  Future<void> signOut() async => await _auth.signOut();
}
