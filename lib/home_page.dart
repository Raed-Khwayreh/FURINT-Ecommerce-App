// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/product/productgridviewcontainer.dart';
import 'package:flutter/material.dart';
import 'HomePage/app_bar_home.dart';
import 'HomePage/card_discount.dart';
import 'HomePage/custom_list.dart';
import 'HomePage/category/gridviewcate.dart';
import 'HomePage/data/category_data.dart';
import 'HomePage/category/listview.dart';
import 'HomePage/navigationbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  fun(String string) {
    if (string == 'All') {
      allSelect = true;
    } else {
      allSelect = false;
      cateSelect = string;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavBar(),
      appBar: appBarDesign(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CardDiscount(),
            ////////////////////ListTitle
            ListTitleCustom('Category', true),
            ////////////////////GridViewCate
            CategoryGridView(),
            ////////////////////ListTitle
            ListTitleCustom('Most Populer', false),
            ///////////////////ListVeiw
            ListVeiwDesign(fun),
            ////////////////////GridViewProduct
            ProductGridViewContainer(),
          ],
        ),
      ),
    );
  }
}
