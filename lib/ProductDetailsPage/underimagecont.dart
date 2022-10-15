// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../HomePage/data/products_data.dart';
import '../HomePage/models/product_model.dart';

class UnderImage extends StatefulWidget {
  ProductModel productModel;
  UnderImage(this.productModel, {super.key});

  @override
  State<UnderImage> createState() => _UnderImageState();
}

class _UnderImageState extends State<UnderImage> {
  int cindex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.fromLTRB(20, 32, 20, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productModel.name,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '\$${widget.productModel.newPrice}',
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
                '\$${widget.productModel.oldPrice}',
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
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 138,
                    height: 30,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return colorContainer(colorList[index], index);
                      },
                      itemCount: 4,
                    ),
                  )
                ],
              ),
            ],
          ),
          boxBetween(),
          Row(
            children: [
              RatingBarIndicator(
                rating: widget.productModel.rate,
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
              boxBetween(),
              Text('( ${widget.productModel.reviews} Reviews )',
                  style: TextStyle(fontSize: 13))
            ],
          ),
          boxBetween(),
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
    );
  }

  SizedBox boxBetween() {
    return SizedBox(
      height: 15,
    );
  }

  InkWell colorContainer(Color color, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          cindex = colorList.indexOf(color);
        });
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: cindex == index
              ? Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.white,
                )
              : Text(''),
        ),
      ),
    );
  }
}
