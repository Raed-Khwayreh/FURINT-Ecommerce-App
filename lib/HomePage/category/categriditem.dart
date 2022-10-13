// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/category_data.dart';

class CategoryGridItem extends StatelessWidget {
  int index;
  CategoryGridItem(this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print(
              '${category[index + 1].name} : ${category[index + 1].image}');
        }
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
              category[index + 1].image,
              height: 33,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            category[index + 1].name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}
