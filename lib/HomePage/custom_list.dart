// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ListTitleCustom extends StatelessWidget {
  String title;
  bool tes;
  ListTitleCustom(this.title, this.tes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: tes ? 15 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 19, 19, 19),
              fontSize: 20,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              color: Color.fromARGB(255, 149, 149, 149),
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
