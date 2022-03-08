// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, unused_import, must_be_immutable, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  Color textColor;
  double fontSize;
  bool obsecureText;
  int maxlines;
  FontWeight fontWeight;
  final customFont;
  final TextEditingController controller;
  String Function(String) validator;

  CustomTextField({
    this.labelText,
    this.obsecureText = false,
    this.textColor = white,
    this.fontSize = 14,
    this.maxlines = 1,
    this.fontWeight = FontWeight.w300,
    this.customFont = GoogleFonts.roboto,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: validator,
          controller: controller,
          cursorColor: textColor,
          obscureText: obsecureText,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            focusColor: textColor,
            labelStyle: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
          maxLines: maxlines,
          style: const TextStyle(color: white),
        ),
      ],
    );
  }
}
