// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Stack stackDesign(String image, String discount) {
  return Stack(
    children: [
      Positioned(
        left: 20,
        top: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textDesgin(
              '$discount%',
              35,
              FontWeight.normal,
            ),
            textDesgin(
              'discount',
              35,
              FontWeight.w600,
            ),
            textDesgin(
              'New collection with',
              12,
              FontWeight.normal,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'shop now',
                style: TextStyle(
                    color: Color.fromARGB(255, 254, 151, 0),
                    fontSize: 16,
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
      Positioned(
        right: 10,
        top: 30,
        child: Image.asset(
          image,
          width: 150,
        ),
      ),
    ],
  );
}

Text textDesgin(
  String text,
  double size,
  FontWeight fontWeight,
) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.white,
        fontSize: size,
        height: 1.2,
        fontWeight: fontWeight),
  );
}
