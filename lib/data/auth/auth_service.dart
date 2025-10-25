import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> forgotPassword({required String email}) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
