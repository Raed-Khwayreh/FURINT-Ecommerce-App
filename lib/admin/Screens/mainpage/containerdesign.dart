// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ContDesign extends StatelessWidget {
  String text;
  ContDesign(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 196, 196, 196),
              offset: Offset(0, 0),
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 45,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Prompt",
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
