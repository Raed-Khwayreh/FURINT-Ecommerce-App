// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ButtomBarDetPage extends StatefulWidget {
  const ButtomBarDetPage({super.key});

  @override
  State<ButtomBarDetPage> createState() => _ButtomBarDetPageState();
}

class _ButtomBarDetPageState extends State<ButtomBarDetPage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
                color: Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(28),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        count != 0 ? {count--} : {};
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                  spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '$count',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 254, 151, 0),
                borderRadius: BorderRadius.circular(28),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Prompt',
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container spacer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Color.fromARGB(255, 225, 225, 225),
      height: 25,
      width: 2,
    );
  }
}
