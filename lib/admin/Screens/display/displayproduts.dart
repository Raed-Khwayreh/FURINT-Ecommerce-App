// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:firstui_project/admin/Screens/display/addproduct.dart';
import 'package:firstui_project/admin/Screens/display/product_widget.dart';
import 'package:firstui_project/admin/adminprovider.dart';
import 'package:firstui_project/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/slideanimation.dart';

class AllProductsScreen extends StatelessWidget {
  CateModel cateModel;
  AllProductsScreen(this.cateModel);
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
                  SliderAnimation(Page: AddNewProduct(cateModel.id!)),
                );
              },
              icon: Icon(Icons.add))
        ],
        title: Text('All Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.allProducts.length,
                itemBuilder: (context, index) {
                  return ProductWidget(provider.allProducts[index]);
                });
      }),
    );
  }
}
