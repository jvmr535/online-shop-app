import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    log(user.toString());
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get user => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
