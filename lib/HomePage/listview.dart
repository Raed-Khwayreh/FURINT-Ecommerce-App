// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'data/category_data.dart';

class ListVeiwDesign extends StatefulWidget {
  Function fun;
  ListVeiwDesign(this.fun, {super.key});

  @override
  State<ListVeiwDesign> createState() => _ListVeiwDesignState();
}

class _ListVeiwDesignState extends State<ListVeiwDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
        height: 50,
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                 widget.fun(category[index].name);
                  for (int i = 0; i < category.length; i++) {
                    category[i].isSelected = false;
                  }
                  category[index].isSelected = true;
                  if (kDebugMode) {
                    print(category[index].name);
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: category[index].isSelected
                      ? Color.fromARGB(255, 254, 151, 0)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: Color.fromARGB(255, 254, 151, 0), width: 0.7),
                ),
                child: Text(
                  category[index].name,
                  style: TextStyle(
                      color: category[index].isSelected
                          ? Colors.white
                          : Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
