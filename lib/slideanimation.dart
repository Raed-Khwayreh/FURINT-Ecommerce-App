// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class SliderAnimation extends PageRouteBuilder {
  final Page;
  SliderAnimation({this.Page})
      : super(
            pageBuilder: (context, animation, anmationtwo) => Page,
            transitionsBuilder: (context, animation, anmationtwo, child) {
              var begin = Offset(1, 0);
              var end = Offset(0, 0);
              var tween = Tween(begin: begin, end: end);
              var ofT = animation.drive(tween);
              return SlideTransition(
                position: ofT,
                child: child,
              );
            });
}
