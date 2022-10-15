// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/stackdesign.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardDiscount extends StatefulWidget {
  const CardDiscount({super.key});

  @override
  State<CardDiscount> createState() => _CardDiscountState();
}

class _CardDiscountState extends State<CardDiscount> {
  int cindex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Stack> l = [
      stackDesign('images/chair.png', '40'),
      stackDesign('images/12.png', '20'),
      stackDesign('images/1.png', '15'),
    ];
    return Container(
      height: 180,
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 254, 151, 0),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              pauseAutoPlayInFiniteScroll: true,
              pauseAutoPlayOnManualNavigate: true,
              onPageChanged: (index, c) {
                setState(() {
                  cindex = index;
                });
              },
            ),
            items: l,
          ),
          Positioned(
              bottom: 3,
              left: size.width / 2.7,
              child: SizedBox(
                height: 20,
                width: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                      width: cindex == index ? 30 : 10,
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
