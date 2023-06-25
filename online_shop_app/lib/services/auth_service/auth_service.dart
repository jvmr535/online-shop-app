import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', user.user!.uid);
    await prefs.setString('user', user.user!.email!);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
    prefs.remove('user');
  }

  Stream<User?> get user => _auth.authStateChanges();

  Future<String?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  String? get userEmail => _auth.currentUser?.email;
}
