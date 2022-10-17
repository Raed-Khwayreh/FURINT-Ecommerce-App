// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../CatePage/catepage.dart';
import '../data/category_data.dart';
import '../models/category_model.dart';

class Item2 extends StatelessWidget {
  const Item2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              'Categories',
              style: TextStyle(fontSize: 22),
            ),
          ),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return listDesign(category[index + 1], context);
              },
              itemCount: 8,
            ),
          )
        ],
      ),
    );
  }

  ListTile listDesign(CateModel cateModel, context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        cateModel.name,
        style: TextStyle(fontSize: 18),
      ),
      leading: Image.asset(
        cateModel.image,
        width: 30,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CatePage(cateModel)),
        );
      },
    );
  }
}
