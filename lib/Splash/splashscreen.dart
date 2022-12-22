// ignore_for_file: prefer_const_constructors, file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firstui_project/mainpage.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

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
                  Text(
                    "Welcome To",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Prompt",
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Text(
                    "FURINT\nSHOP",
                    style: TextStyle(
                        fontSize: 60,
                        fontFamily: "Prompt",
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Text(
                      "A big world of selling furniture and everything you need when preparing your home",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Prompt",
                          color: Color.fromARGB(255, 141, 84, 4),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )),
        ],
      ),
      nextScreen: MainPage(),
      duration: 3500,
      backgroundColor: Colors.white,
    );
  }
}
