// ignore_for_file: prefer_const_constructors, must_be_immutable,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  Item1({super.key});
  List cont = [
    {
      'name': 'Profile',
      'icon': Icons.person,
    },
    {
      'name': 'Settings',
      'icon': Icons.settings,
    },
    {
      'name': 'Logout',
      'icon': Icons.logout,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountsDrawerHeader(
          margin: EdgeInsets.only(right: 15),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Color.fromARGB(175, 255, 205, 131),
            child: Text("R",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 255, 255, 255))),
          ),
          decoration: BoxDecoration(color: Color.fromARGB(255, 254, 151, 0)),
          accountName: Text('Ra\'ed Khwayreh'),
          accountEmail: Text('raed@gmail.com'),
        ),
        Container(
          margin: EdgeInsets.all(15),
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return listDesign(cont[index]);
            },
            itemCount: 3,
          ),
        )
      ],
    );
  }

  ListTile listDesign(Map map) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        map['name'],
        style: TextStyle(fontSize: 18),
      ),
      leading: Icon(
        map['icon'],
        color: Color.fromARGB(255, 254, 151, 0),
      ),
      onTap: () {},
    );
  }
}
