// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:firstui_project/models/category_model.dart';
import 'package:firstui_project/HomePage/products/grid.dart';
import 'package:flutter/material.dart';

import '../data/products_data.dart';

class CatePage extends StatelessWidget {
  CateModel cateModel;
  CatePage(this.cateModel, {super.key});

  funFav() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 236, 236, 236),
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              cateModel.name,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            Icon(
              Icons.search,
              size: 35,
              color: Color.fromARGB(255, 254, 151, 0),
            ),
          ],
        ),
      ),
      body: products
              .where((element) => element.category == cateModel.name)
              .isEmpty
          ? Center(
              child: Text(
                'no items in this category',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
            )
          : Grid(
              products
                  .where((element) => element.category == cateModel.name)
                  .length,
              products
                  .where((element) => element.category == cateModel.name)
                  .toList(),
              true,
              funFav),
    );
  }
}
