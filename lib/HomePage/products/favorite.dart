// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:firstui_project/HomePage/products/grid.dart';
import 'package:flutter/material.dart';

import '../../data/products_data.dart';

class Favorite extends StatelessWidget {
  Function favFun;
  Favorite(this.favFun, {super.key});

  @override
  Widget build(BuildContext context) {
    return products.where((element) => element.fav!).isEmpty
        ? Center(
            child: Text(
              'There is no favorite items',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          )
        : Grid(products.where((element) => element.fav!).length,
            products.where((element) => element.fav!).toList(), true, favFun);
  }
}
