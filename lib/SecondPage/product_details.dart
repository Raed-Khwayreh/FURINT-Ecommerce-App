// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:first_project/HomePage/data/products_data.dart';
import 'package:first_project/HomePage/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 242, 242, 242),
              width: size.width,
              height: size.height / 2.3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 15,
                    left: 15,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      productModel.image,
                      width: 190,
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: 30,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 151, 0),
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: 100,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 254, 151, 0),
                          borderRadius: BorderRadius.circular(50)),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.fromLTRB(20, 32, 20, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${productModel.newPrice}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '\$${productModel.oldPrice}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'brand : IKEA',
                      ),
                      Row(
                        children: [
                          Text('colour'),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 230, 210, 176),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 238, 81, 19),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 14, 77, 164),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 69, 172, 10),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: productModel.rate,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 25,
                        unratedColor: Color.fromARGB(255, 218, 218, 218),
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('( ${productModel.reviews} Reviews )',
                          style: TextStyle(fontSize: 13))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'When you have the right office chair, sitting and doing your work is more comfortable.\nWe have a huge selection of office chairs and kids chairs like stools that are of thar height and seat backs that you\'ll live! Buy',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 190, 190, 190),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 190, 190, 190),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '+',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 254, 151, 0),
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Prompt',
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
