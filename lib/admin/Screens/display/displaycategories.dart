// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, use_key_in_widget_constructors

import 'package:firstui_project/admin/Screens/addCategoryPage/addCate.dart';
import 'package:firstui_project/admin/Screens/display/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/slideanimation.dart';
import '../../adminprovider.dart';

class AllCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 151, 0),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SliderAnimation(Page: AddCate()),
                );
              },
              icon: Icon(Icons.add))
        ],
        title: Text('All Categories'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allCategories == null
            ? Center(
                child: Text('No Categories Found'),
              )
            : ListView.builder(
                itemCount: provider.allCategories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(provider.allCategories[index]);
                });
      }),
    );
  }
}
