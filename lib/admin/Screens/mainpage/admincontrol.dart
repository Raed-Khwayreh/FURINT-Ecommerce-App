// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:firstui_project/admin/Screens/addCategoryPage/addCate.dart';
import 'package:firstui_project/admin/Screens/display/displaycategories.dart';
import 'package:flutter/material.dart';

import '../../../Helpers/slideanimation.dart';
import 'containerdesign.dart';

class AdminControl extends StatelessWidget {
  const AdminControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  SliderAnimation(Page: AllCategoriesScreen()),
                );
              },
              child: Icon(Icons.category)),
          SizedBox(
            width: 25,
          )
        ],
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
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SliderAnimation(Page: AddCate()),
                  );
                },
                child: ContDesign("Add New Category")),
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
