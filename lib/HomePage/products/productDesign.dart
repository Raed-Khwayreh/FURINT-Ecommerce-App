// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables

import 'package:firstui_project/models/product_model.dart';
import 'package:firstui_project/ProductDetailsPage/product_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ProductDesign extends StatelessWidget {
  ProductModel productModel;
  Function favFun;
  ProductDesign(this.productModel, this.favFun, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(productModel)),
        );
        if (kDebugMode) {
          print('${productModel.name} ');
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: MediaQuery.of(context).size.width < 800
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
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
                      productModel.image,
                      width: 110,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: InkWell(
                      onTap: () {
                        favFun(productModel);
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                        color: productModel.fav ? Colors.red : Colors.grey,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              productModel.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
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
                '${productModel.rate}',
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
                '\$${productModel.newPrice}',
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
          )
        ],
      ),
    );
  }
}
