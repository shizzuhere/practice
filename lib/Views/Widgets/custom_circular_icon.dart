// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';

class CustomCirleIcon extends StatelessWidget {
  double radius;
  Color bgColor;
  String imgPath;
  Function function;

  CustomCirleIcon({
    this.radius = 24,
    this.bgColor = white,
    this.imgPath = "assets/na.png",
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          function();
        },
        child: CircleAvatar(
            radius: (radius),
            backgroundColor: bgColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(imgPath),
            )));
  }
}
