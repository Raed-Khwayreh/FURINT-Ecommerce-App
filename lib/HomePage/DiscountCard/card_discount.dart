// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/DiscountCard/stackdesign.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardDiscount extends StatefulWidget {
  const CardDiscount({super.key});

  @override
  State<CardDiscount> createState() => _CardDiscountState();
}

class _CardDiscountState extends State<CardDiscount> {
  bool auto = true;
  int cindex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackImages = [
      StackDesign('images/chair.png', '40'),
      StackDesign('images/12.png', '20'),
      StackDesign('images/1.png', '15'),
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
              autoPlay: auto,
              autoPlayAnimationDuration: Duration(milliseconds: 200),
              pauseAutoPlayInFiniteScroll: true,
              pauseAutoPlayOnManualNavigate: true,
              onPageChanged: (index, c) {
                setState(() {
                  cindex = index;
                });
              },
            ),
            items: stackImages,
          ),
          Positioned(
              bottom: 3,
              left: MediaQuery.of(context).size.width < 600
                  ? MediaQuery.of(context).size.width * 0.4
                  : MediaQuery.of(context).size.width > 1200
                      ? MediaQuery.of(context).size.width * 0.2
                      : MediaQuery.of(context).size.width * 0.3,
              child: SizedBox(
                height: 20,
                width: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: cindex == index
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color.fromARGB(255, 249, 249, 249)
                                  .withOpacity(0.6),
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 6),
                      width: 8,
                    );
                  },
                ),
              )),
          // Positioned(
          //   top: 0,
          //   right: 20,
          //   child: Switch(
          //     activeColor: Colors.white,
          //     value: auto,
          //     onChanged: (s) {
          //       setState(() {
          //         auto = s;
          //       });
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
