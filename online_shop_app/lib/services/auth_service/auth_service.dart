import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferences _sharedPreferences =
      GetIt.instance<SharedPreferences>();

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      await user?.updateDisplayName(displayName);

      user = _auth.currentUser;
    } catch (e) {
      log("Error registering user: $e");
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _sharedPreferences.setString('uid', user.user!.uid);
    await _sharedPreferences.setString('user', user.user!.email!);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _sharedPreferences.remove('uid');
    _sharedPreferences.remove('user');
  }

  Stream<User?> get user => _auth.authStateChanges();

  Future<String?> getCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('uid');
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  String? get userEmail => _auth.currentUser?.email;
}
