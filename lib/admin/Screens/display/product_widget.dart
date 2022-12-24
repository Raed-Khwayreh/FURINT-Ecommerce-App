// ignore_for_file: prefer_adjacent_string_concatenation, prefer_const_constructors

import 'package:firstui_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  ProductModel product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                  child: SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    right: 15,
                    top: 10,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.edit)),
                        ),
                      ],
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Product Name' + ': ' + product.name,
                    ),
                    Text(
                      'Product Price' + ': ' + product.newPrice,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
