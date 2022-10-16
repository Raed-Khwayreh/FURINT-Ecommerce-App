// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/data/category_data.dart';
import 'package:firstui_project/HomePage/data/products_data.dart';
import 'package:firstui_project/HomePage/products/grid.dart';
import 'package:flutter/material.dart';

class ProductGridViewContainer extends StatelessWidget {
  Function favFun;
  ProductGridViewContainer(this.favFun, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: calcultationsForContainerHeight(allSelect
          ? products.length.toDouble()
          : products
              .where((element) => element.category == cateSelect)
              .length
              .toDouble()),
      child:
          products.where((element) => element.category == cateSelect).isEmpty &&
                  !allSelect
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
                  allSelect
                      ? products.length
                      : products
                          .where((element) => element.category == cateSelect)
                          .length,
                  allSelect
                      ? products
                      : products
                          .where((element) => element.category == cateSelect)
                          .toList(),
                  false,
                  favFun),
    );
  }

  double calcultationsForContainerHeight(double length) {
    return allSelect
        ? 306 * (length / 2).round().toDouble() + length * 3
        : products.where((element) => element.category == cateSelect).isEmpty
            ? 50
            : 306 * (length / 2).round().toDouble() + length * 3;
  }
}
