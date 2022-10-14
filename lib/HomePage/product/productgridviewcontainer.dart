// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/data/category_data.dart';
import 'package:firstui_project/HomePage/data/products_data.dart';
import 'package:firstui_project/HomePage/product/grid.dart';
import 'package:flutter/material.dart';

class ProductGridViewContainer extends StatelessWidget {
  const ProductGridViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: allSelect ? 920 : calc(),
      child: Grid(
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
          false),
    );
  }

  double calc() {
    return products
                .where((element) => element.category == cateSelect)
                .length
                .toDouble() ==
            0
        ? 30
        : 306 *
            (products
                                .where(
                                    (element) => element.category == cateSelect)
                                .length
                                .toDouble() %
                            2 !=
                        0 &&
                    products
                            .where((element) => element.category == cateSelect)
                            .length
                            .toDouble() !=
                        1
                ? products
                        .where((element) => element.category == cateSelect)
                        .length
                        .toDouble() -
                    1
                : 1);
  }
}
