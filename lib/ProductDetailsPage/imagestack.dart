// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:firstui_project/models/product_model.dart';
import 'package:flutter/material.dart';

class StackImage extends StatelessWidget {
  ProductModel productModel;
  StackImage(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  border: Border.all(
                    color: Color.fromARGB(255, 229, 229, 229),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
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
        arrowsDesign(
          30,
          Icons.arrow_forward_ios,
        ),
        arrowsDesign(
          100,
          Icons.arrow_back_ios_new,
        ),
      ],
    );
  }

  Positioned arrowsDesign(double right, IconData icon) {
    return Positioned(
      bottom: -20,
      right: right,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 254, 151, 0),
            borderRadius: BorderRadius.circular(50)),
        child: InkWell(
          onTap: () {},
          child: Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
