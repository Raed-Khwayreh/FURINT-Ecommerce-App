// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/data/products_data.dart';
import 'package:firstui_project/HomePage/products/favorite.dart';
import 'package:firstui_project/HomePage/models/product_model.dart';
import 'package:firstui_project/HomePage/products/productgridviewcontainer.dart';
import 'package:firstui_project/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'HomePage/app_bar_home.dart';
import 'HomePage/DiscountCard/card_discount.dart';
import 'HomePage/custom_list.dart';
import 'HomePage/category/gridviewcate.dart';
import 'HomePage/data/category_data.dart';
import 'HomePage/category/listview.dart';
import 'HomePage/navigationbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int i = 0;
  funList(String string) {
    if (string == 'All') {
      allSelect = true;
    } else {
      allSelect = false;
      cateSelect = string;
    }
    setState(() {});
  }

  funFav(ProductModel productModel) {
    int i = products.indexOf(productModel);
    products[i].fav = !products[i].fav;
    setState(() {});
  }

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  funPage(int index) {
    tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavBar(funPage),
      appBar: AppBarDesign(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          HomePage(funList, funFav),
          Center(
            child: Text('Orders'),
          ),
          Favorite(funFav),
          Center(
            child: Text('Wallet'),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
