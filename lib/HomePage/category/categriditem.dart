// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables
import 'package:firstui_project/CatePage/catepage.dart';
import 'package:firstui_project/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  CateModel cateModel;
  CategoryGridItem(this.cateModel, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CatePage(cateModel)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Image.asset(
              cateModel.image,
              height: 33,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            cateModel.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}
