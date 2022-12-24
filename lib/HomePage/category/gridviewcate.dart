// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/admin/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/category_data.dart';
import 'categriditem.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AdminProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: size.height / 3.4,
          child: GridView.builder(
            physics: provider.allCategories.length < 8
                ? NeverScrollableScrollPhysics()
                : ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6,
              mainAxisExtent: 120,
            ),
            itemCount: provider.allCategories.length,
            itemBuilder: (context, index) {
              return CategoryGridItem(provider.allCategories[index]);
            },
          ),
        );
      },
    );
  }
}
