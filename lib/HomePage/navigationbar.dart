// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 4,
      currentIndex: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      selectedItemColor: Color.fromARGB(255, 254, 151, 0),
      unselectedItemColor: Color.fromARGB(255, 186, 186, 186),
      type: BottomNavigationBarType.fixed,
      items: [
        bottomItem('Home', Icons.grid_view_rounded),
        bottomItem('Cart', Icons.shopping_bag_outlined),
        bottomItem('Orders', Icons.shopping_cart_rounded),
        bottomItem('Wallet', Icons.wallet),
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
