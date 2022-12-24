// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/Helpers/funvalid.dart';
import 'package:firstui_project/Login/signup.dart';
import 'package:firstui_project/Helpers/textfielddesign.dart';
import 'package:firstui_project/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../User Providers/signprovider.dart';
import '../Helpers/slideanimation.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.fromLTRB(25, 70, 25, 0),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          provider.reset();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                        )),
                    SizedBox(
                      width: 120,
                    ),
                    textStyle(
                      "Sign in",
                      20,
                      FontWeight.w500,
                      Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "images/signin.png",
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textStyle(
                        "Email",
                        14,
                        FontWeight.w500,
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldDesign((val) {
                        return validInput(val!, 0, 0, "email");
                      }, email, TextInputType.emailAddress, "raed@gmail.com",
                          false, false),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textStyle(
                        "Password",
                        14,
                        FontWeight.w500,
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      TextFieldDesign((val) {
                        return validInput(val!, 6, 20, "password");
                      }, password, TextInputType.name, "**********",
                          provider.hidePassSignIn, false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formstate.currentState!.validate()) {
                      if (await provider.signIn(email.text, password.text)) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          SliderAnimation(Page: MainPage()),
                          (route) => route.isFirst,
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Color.fromARGB(255, 254, 151, 0),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 135,
                    ),
                  ),
                  child: textStyle(
                    "Sign in",
                    18,
                    FontWeight.w400,
                    Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                  child: textStyle(
                    "Don't have an account",
                    13,
                    FontWeight.normal,
                    Color.fromARGB(255, 254, 151, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Text textStyle(String text, double size, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: "Prompt",
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
