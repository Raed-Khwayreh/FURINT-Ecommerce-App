// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  Future<String?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.uid;
    } on Exception catch (e) {
      log('Error in registeration $e');
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.uid;
    } on Exception catch (e) {
      log('Error in registeration $e');
    }
  }

  String? checkUser() {
    User? user = firebaseAuth.currentUser;

    return user?.uid;
  }

  signOut() async {
    await firebaseAuth.signOut();
  }
}
