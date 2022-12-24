// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:developer';

import 'package:firstui_project/Helpers/authhelper.dart';
import 'package:firstui_project/Login/signin.dart';
import 'package:firstui_project/Login/signup.dart';
import 'package:flutter/material.dart';

import '../Helpers/slideanimation.dart';

class LetsGo extends StatelessWidget {
  const LetsGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 80),
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 255, 255, 255),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textStyle("Let's you in", 20, FontWeight.w500,
                  Color.fromARGB(255, 0, 0, 0)),
              SizedBox(
                height: 80,
              ),
              Image.asset(
                "images/lets.png",
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SliderAnimation(Page: SignIn()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Color.fromARGB(255, 254, 151, 0),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                ),
                child: textStyle(
                  "Sign in with password",
                  20,
                  FontWeight.w400,
                  Colors.white,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 200,
                child: Row(
                  children: [
                    textStyle(
                      "Don't have an account",
                      13,
                      FontWeight.normal,
                      Color.fromARGB(255, 114, 114, 114),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          SliderAnimation(Page: SignUp()),
                        );
                      },
                      child: textStyle(
                        "Sign up",
                        13,
                        FontWeight.normal,
                        Color.fromARGB(255, 254, 151, 0),
                      ),
                    ),
                  ],
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
}
