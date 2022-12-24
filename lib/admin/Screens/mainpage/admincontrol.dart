// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'containerdesign.dart';

class AdminControl extends StatelessWidget {
  const AdminControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Control"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 254, 151, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            ContDesign("Add New Category"),
            ContDesign("Add New Product"),
            ContDesign("Add New Offer"),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
