// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  String buttonText;
  Color textColor;
  double textSize;
  Function function;

  CustomTextButton({
    Key key,
    this.buttonText = "Button",
    this.textColor = green,
    this.textSize = 16,
    this.function,
  }): super (key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(
          buttonText,
          style: TextStyle(color: textColor, fontSize: textSize),
        ),
        onPressed: () {
          function();
        });
  }
}
