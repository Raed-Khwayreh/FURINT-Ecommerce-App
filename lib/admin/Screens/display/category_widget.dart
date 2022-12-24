// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, use_key_in_widget_constructors

import 'package:firstui_project/admin/Screens/display/displayproduts.dart';
import 'package:firstui_project/admin/Screens/display/editcat.dart';
import 'package:firstui_project/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/slideanimation.dart';
import '../../adminprovider.dart';

class CategoryWidget extends StatelessWidget {
  CateModel category;
  CategoryWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<AdminProvider>(context, listen: false)
            .getAllProducts(category.id!);
        Navigator.push(
          context,
          SliderAnimation(Page: AllProductsScreen()),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                  child: SizedBox(
                      width: double.infinity,
                      height: 180,
                      child: Image.network(
                        category.image,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    right: 15,
                    top: 10,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Provider.of<AdminProvider>(context,
                                        listen: false)
                                    .deleteCategory(category);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 254, 151, 0),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  SliderAnimation(Page: EditCategory(category)),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 254, 151, 0),
                              )),
                        ),
                      ],
                    ))
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: textStyle(
                'Category Name' + ' : ' + category.name,
                18,
                FontWeight.w400,
                Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
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
