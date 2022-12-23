// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class SignProvider extends ChangeNotifier {
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
}
