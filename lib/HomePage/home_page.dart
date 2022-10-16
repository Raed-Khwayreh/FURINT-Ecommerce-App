// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'DiscountCard/card_discount.dart';
import 'category/gridviewcate.dart';
import 'category/listview.dart';
import 'custom_list.dart';
import 'products/productgridviewcontainer.dart';

class HomePage extends StatelessWidget {
  Function funFav;
  Function funList;
  HomePage(this.funList, this.funFav, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          ListVeiwDesign(funList),
          ////////////////////GridViewProduct
          ProductGridViewContainer(funFav),
        ],
      ),
    );
  }
}
