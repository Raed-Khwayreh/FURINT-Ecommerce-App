// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../data/category_data.dart';
import 'listviewitem.dart';

class ListVeiwDesign extends StatelessWidget {
  Function fun;
  ListVeiwDesign(this.fun, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
        height: 50,
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, index) {
            return ListViewItem(fun, category[index]);
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
