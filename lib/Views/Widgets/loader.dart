import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundOne,
      child: const Center(
        child: SpinKitPouringHourGlass(
          color: white,
        ),
      ),
    );
  }
}
