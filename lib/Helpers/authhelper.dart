// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  signIn(String email, String password) async {}
  signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log("Roro");
    } catch (e) {
      log(e.toString());
    }
  }

  signOut() async {}
}
