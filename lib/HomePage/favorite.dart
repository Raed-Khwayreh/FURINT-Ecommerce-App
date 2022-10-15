import 'package:firstui_project/HomePage/product/grid.dart';
import 'package:flutter/material.dart';

import 'data/products_data.dart';

class Favorite extends StatelessWidget {
  Function favFun;
  Favorite(this.favFun, {super.key});

  @override
  Widget build(BuildContext context) {
    return Grid(products.where((element) => element.fav).length,
        products.where((element) => element.fav).toList(), true, favFun);
  }
}
