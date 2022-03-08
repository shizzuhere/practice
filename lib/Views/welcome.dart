// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Controller/auth_controller.dart';
import 'package:flutter_application_1/Views/Widgets/button.dart';
import 'package:flutter_application_1/Views/Widgets/custom_card.dart';
import 'package:flutter_application_1/Views/Widgets/loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

// AuthController _authController = Get.put(AuthController());

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // _authController.getUserData();
    return Scaffold(
      body: GetBuilder<AuthController>(
          init: AuthController(),
          // initState: (_) {
          //   // AuthController authcontroller = Get.put(AuthController());
          // },
          builder: (authController) {
            return authController.isLoading
                ? const Loader()
                : SafeArea(
                    child: Container(
                      color: backGroundOne,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Custom_Card(
                                      title: "Email ",
                                      subtitle:
                                          authController.userModel.email ??
                                              "N/A"),
                                  Custom_Card(
                                      title: "First Name ",
                                      subtitle:
                                          authController.userModel.firstName ??
                                              "N/A"),
                                  Custom_Card(
                                      title: "Last Name ",
                                      subtitle:
                                          authController.userModel.lastName ??
                                              "N/A"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: CustomButton(
                                  buttonText: 'Logout',
                                  buttonColor: Colors.red,
                                  function: () {
                                    // setState(() => loading = true);
                                    authController.signout();
                                    Fluttertoast.showToast(
                                        msg: "Sign Out",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
