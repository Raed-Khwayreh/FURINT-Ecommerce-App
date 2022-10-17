// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/Responsive/item1.dart';
import 'package:firstui_project/HomePage/Responsive/item2.dart';
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
    return Row(
      children: [
        Visibility(
          visible: MediaQuery.of(context).size.width > 1200,
          child: Expanded(flex: 2, child: Item1()),
        ),
        Visibility(
          visible: MediaQuery.of(context).size.width > 600,
          child: Expanded(
            flex: MediaQuery.of(context).size.width > 900
                ? MediaQuery.of(context).size.width > 1200
                    ? 2
                    : 2
                : 1,
            child: Item2(),
          ),
        ),
        Expanded(
          flex: MediaQuery.of(context).size.width > 900 ? 3 : 2,
          child: SingleChildScrollView(
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
          ),
        ),
      ],
    );
  }
}
