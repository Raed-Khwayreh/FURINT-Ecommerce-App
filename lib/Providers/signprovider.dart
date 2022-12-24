// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Helpers/authhelper.dart';
import '../Helpers/firestore_helper.dart';
import '../Helpers/storage_helper.dart';
import '../models/app_user.dart';

class SignProvider extends ChangeNotifier {
  AppUser? loggedUser;
  bool hidePassSignIn = true;
  bool hidePassSignUp = true;
  Icon icoSignIn = Icon(
    Icons.remove_red_eye,
    color: Color.fromARGB(255, 254, 151, 0),
  );
  Icon icoSignUp = Icon(
    Icons.remove_red_eye,
    color: Color.fromARGB(255, 254, 151, 0),
  );
  changeIconShowSignIn() {
    icoSignIn = Icon(
      Icons.remove_red_eye_outlined,
      color: Color.fromARGB(255, 254, 151, 0),
    );
    hidePassSignIn = false;
    notifyListeners();
  }

  changeIconHideSignIn() {
    icoSignIn = Icon(
      Icons.remove_red_eye,
      color: Color.fromARGB(255, 254, 151, 0),
    );
    hidePassSignIn = true;
    notifyListeners();
  }

  changeIconShowSignUp() {
    icoSignUp = Icon(
      Icons.remove_red_eye_outlined,
      color: Color.fromARGB(255, 254, 151, 0),
    );
    hidePassSignUp = false;
    notifyListeners();
  }

  changeIconHideSignUp() {
    icoSignUp = Icon(
      Icons.remove_red_eye,
      color: Color.fromARGB(255, 254, 151, 0),
    );
    hidePassSignUp = true;
    notifyListeners();
  }

  reset() {
    hidePassSignIn = true;
    hidePassSignUp = true;
    icoSignIn = Icon(
      Icons.remove_red_eye,
      color: Color.fromARGB(255, 254, 151, 0),
    );
    icoSignUp = Icon(
      Icons.remove_red_eye,
      color: Color.fromARGB(255, 254, 151, 0),
    );
    notifyListeners();
  }

  signIn(String email, String password) async {
    String? userId = await AuthHelper.authHelper.signIn(email, password);
    if (userId != null) {
      loggedUser =
          await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
      notifyListeners();
    }
  }

  signUp(String name, String email, String phone, String password) async {
    String? result = await AuthHelper.authHelper.signUp(email, password);
    if (result != null) {
      FirestoreHelper.firestoreHelper.addNewUser(
        AppUser(
          id: result,
          email: email,
          userName: name,
          phoneNumber: phone,
        ),
      );
      return true;
    }
  }

  getUser(String id) async {
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFirestore(id);
    loggedUser!.id = id;
    notifyListeners();
  }

  checkUser() async {
    String? userId = AuthHelper.authHelper.checkUser();

    if (userId != null) {
      getUser(userId);
    } else {}
  }

  signOut() async {
    await AuthHelper.authHelper.signOut();
    // AppRouter.appRouter.goToWidgetAndReplace(SignInScreen());
  }

  uploadNewFile() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(pickedFile!.path);
    String imageUrl =
        await StorageHelper.storageHelper.uploadNewImage('user_images', file);

    loggedUser!.imageUrl = imageUrl;

    await FirestoreHelper.firestoreHelper.updateTheUser(loggedUser!);
    getUser(loggedUser!.id!);
  }
}
