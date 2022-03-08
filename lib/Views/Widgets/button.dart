// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  final FontWeight fontWeight;
  final double fontSize;
  final Function() function;

  const CustomButton({
    Key key,
    this.buttonText = 'No Name defined',
    this.textColor = white,
    this.buttonColor = green,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 20,
    this.function,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        onDoubleTap: () {
          // Fluttertoast.showToast(
          //     msg: "Button already tabbed",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        },
        child: Container(
          width: 310,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            color: buttonColor,
          ),
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: textColor,
            ),
          )),
        ));
  }
}
