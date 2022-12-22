// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/Login/signup.dart';
import 'package:firstui_project/mainpage.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Color color = Color.fromARGB(255, 254, 151, 0);
  bool bol = true;
  Icon ico = Icon(
    Icons.remove_red_eye,
    color: Color.fromARGB(255, 254, 151, 0),
  );
  @override
  Widget build(BuildContext context) {
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
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                      )),
                  SizedBox(
                    width: 120,
                  ),
                  textStyle(
                    "Sing in",
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
              Column(
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
                  textFieldDesign((val) {
                    return "";
                  }, email, TextInputType.emailAddress, "raed@gmail.com",
                      false),
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
                  textFieldDesign((val) {
                    return "";
                  }, email, TextInputType.name, "**********", true),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
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

  TextFormField textFieldDesign(
      final String? Function(String?)? valid,
      TextEditingController cont,
      TextInputType inputType,
      String hint,
      bool obscureTextState) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: cont,
      keyboardType: inputType,
      obscureText: obscureTextState,
      decoration: InputDecoration(
        suffix: hint == "**********"
            ? InkWell(
                onTap: () {
                  if (bol == true) {
                    ico = Icon(
                      Icons.remove_red_eye_outlined,
                      color: color,
                    );
                    bol = false;
                  } else {
                    ico = Icon(
                      Icons.remove_red_eye,
                      color: color,
                    );
                    bol = true;
                  }
                },
                child: ico,
              )
            : InkWell(
                child: Text(""),
              ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 245, 245, 245),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 245, 245, 245),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        hintText: hint,
        fillColor: Color.fromARGB(255, 245, 245, 245),
        filled: true,
        hintStyle: TextStyle(
            fontFamily: "Prompt2", color: Color.fromARGB(255, 197, 197, 197)),
      ),
    );
  }
}
