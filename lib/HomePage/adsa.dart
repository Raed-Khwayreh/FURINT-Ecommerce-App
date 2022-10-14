import 'package:firstui_project/HomePage/product/grid.dart';
import 'package:flutter/material.dart';

import 'data/products_data.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Grid(
        products.where((element) => element.fav).length,
        products.where((element) => element.fav).toList(),
        true,
      ),
    );
  }
}
