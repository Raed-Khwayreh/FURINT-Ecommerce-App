// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:firstui_project/HomePage/Responsive/item1.dart';
import 'package:firstui_project/HomePage/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'buttombar.dart';
import 'imagestack.dart';
import 'underimagecont.dart';

class ProductDetails extends StatelessWidget {
  ProductModel productModel;
  ProductDetails(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 242, 242, 242),
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
      ),
      body: Row(
        children: [
          Expanded(child: Item1()),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 242, 242, 242),
                    width: size.width,
                    height: size.height / 2.3,
                    child: StackImage(productModel),
                  ),
                  Stack(
                    children: [
                      Positioned(
                          top: 75,
                          right: 25,
                          child: Row(
                            children: [
                              Icon(
                                Icons.beenhere,
                                color: Color.fromARGB(255, 17, 184, 23),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${productModel.orders} ordres',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 17, 184, 23),
                                ),
                              ),
                            ],
                          )),
                      UnderImage(productModel),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtomBarDetPage(),
    );
  }
}
