// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  int maxlines;
  FontWeight fontWeight;
  final customFont;

  CustomText({
    Key key,
    this.text,
    this.color = black,
    this.fontSize = 26,
    this.maxlines = 1,
    this.fontWeight = FontWeight.normal,
    this.customFont = GoogleFonts.roboto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      style: customFont(
          textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      )),
    );
  }
}
