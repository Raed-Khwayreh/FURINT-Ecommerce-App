// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/category_data.dart';
import '../models/category_model.dart';

class ListViewItem extends StatefulWidget {
  Function fun;
  CateModel cateModel;
  ListViewItem(this.fun, this.cateModel, {super.key});

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.fun(widget.cateModel.name);
          for (int i = 0; i < category.length; i++) {
            category[i].isSelected = false;
          }
          widget.cateModel.isSelected = true;
          if (kDebugMode) {
            print(widget.cateModel..name);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.cateModel.isSelected
              ? Color.fromARGB(255, 254, 151, 0)
              : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border:
              Border.all(color: Color.fromARGB(255, 254, 151, 0), width: 0.7),
        ),
        child: Text(
          widget.cateModel.name,
          style: TextStyle(
              color: widget.cateModel.isSelected ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
