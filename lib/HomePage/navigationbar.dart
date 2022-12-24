// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  Function funPage;
  NavBar(this.funPage, {super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: ((value) {
        currentIndex = value;
        setState(() {});
        widget.funPage(value);
      }),
      elevation: 4,
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Color.fromARGB(255, 254, 151, 0),
      unselectedItemColor: Color.fromARGB(255, 186, 186, 186),
      type: BottomNavigationBarType.fixed,
      items: [
        bottomItem('Home', Icons.grid_view_rounded),
        bottomItem('Orders', Icons.shopping_cart_rounded),
        bottomItem('Favorite', Icons.favorite),
        bottomItem('Profile', Icons.person),
      ],
    );
  }

  BottomNavigationBarItem bottomItem(String text, IconData icon) {
    return BottomNavigationBarItem(
      label: text,
      icon: Container(
        padding: EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 30,
        ),
      ),
    );
  }
}
