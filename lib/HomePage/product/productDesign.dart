// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables

import 'package:firstui_project/HomePage/models/product_model.dart';
import 'package:firstui_project/SecondPage/product_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDesign extends StatefulWidget {
  ProductModel productModel;
  ProductDesign(this.productModel, {super.key});

  @override
  State<ProductDesign> createState() => _ProductDesignState();
}

class _ProductDesignState extends State<ProductDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(widget.productModel)),
        );
        if (kDebugMode) {
          print('${widget.productModel.name} ');
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 174,
              height: 174,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      widget.productModel.image,
                      width: 110,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: InkWell(
                      onTap: () {
                        widget.productModel.fav = !widget.productModel.fav;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.favorite_rounded,
                        color: widget.productModel.fav
                            ? Colors.red
                            : Color.fromARGB(255, 195, 195, 195),
                        size: 25,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 2,
          ),
          Text(
            widget.productModel.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.amber,
                size: 25,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${widget.productModel.rate}',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Color.fromARGB(255, 94, 94, 94)),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${widget.productModel.newPrice}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 23,
                  color: Color.fromARGB(255, 254, 151, 0),
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
          )
        ],
      ),
    );
  }
}
