// ignore_for_file: prefer_const_constructors, file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firstui_project/Login/letsgo.dart';
import 'package:firstui_project/admin/Screens/mainpage/admincontrol.dart';
import 'package:firstui_project/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../User Providers/signprovider.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: double.infinity,
      splash: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Splash.jpg"), fit: BoxFit.cover),
            ),
          ),
          Positioned(
              left: 20,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textStyle(
                      "Welcome To", 25, FontWeight.normal, Colors.white, false),
                  textStyle(
                    "FURINT\nSHOP",
                    60,
                    FontWeight.bold,
                    Colors.white,
                    false,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: textStyle(
                      "A big world of selling furniture and everything you need when preparing your home",
                      15,
                      FontWeight.w300,
                      Color.fromARGB(255, 141, 84, 4),
                      true,
                    ),
                  ),
                ],
              )),
        ],
      ),
      nextScreen: // Provider.of<SignProvider>(context, listen: false).w,
          AdminControl(),
      duration: 3000,
    );
  }

  Text textStyle(
      String text, double size, FontWeight fontWeight, Color color, bool flag) {
    return Text(
      text,
      textAlign: flag ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: size,
        fontFamily: "Prompt",
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
