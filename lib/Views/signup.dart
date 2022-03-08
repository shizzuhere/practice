// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Constants/helper_functions.dart';
import 'package:flutter_application_1/Controller/auth_controller.dart';
import 'package:flutter_application_1/Views/Widgets/button.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text_Field.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text_button.dart';
import 'package:flutter_application_1/Views/Widgets/custom_circular_icon.dart';
import 'package:flutter_application_1/Views/Widgets/loader.dart';
import 'package:flutter_application_1/Views/signin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundOne,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 44, right: 43),
            child: GetBuilder<AuthController>(
                init: AuthController(),
                builder: (authController) {
                  return authController.isLoading
                      ? const Loader()
                      : SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 122,
                                ),
                                CustomText(
                                  text: "Welcome to app",
                                  color: green,
                                  fontSize: 52.sp,
                                  customFont: GoogleFonts.sourceSansPro,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text:
                                      "Create an account to access 50 million songs and playlists and music created by out editors.",
                                  maxlines: 2,
                                  color: white,
                                  fontSize: 32.sp,
                                  customFont: GoogleFonts.sourceSansPro,
                                  fontWeight: FontWeight.w300,
                                ),
                                const SizedBox(
                                  height: 66,
                                ),
                                Form(
                                  key: signUpKey,
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        labelText: 'First name*',
                                        controller:
                                            authController.firstNameController,
                                        validator: nameValidator,
                                        textColor: white,
                                        fontSize: 14 * 2.sp,
                                      ),
                                      const SizedBox(
                                        height: 53,
                                      ),
                                      CustomTextField(
                                        labelText: 'Last name*',
                                        controller:
                                            authController.lastNameController,
                                        textColor: white,
                                        fontSize: 14 * 2.sp,
                                      ),
                                      const SizedBox(
                                        height: 53,
                                      ),
                                      CustomTextField(
                                        labelText: 'Email Address*',
                                        controller:
                                            authController.emailController,
                                        validator: emailValidator,
                                        textColor: white,
                                        fontSize: 14 * 2.sp,
                                      ),
                                      const SizedBox(
                                        height: 53,
                                      ),
                                      CustomTextField(
                                        labelText: 'Password*',
                                        controller:
                                            authController.passwordController,
                                        obsecureText: true,
                                        textColor: white,
                                        fontSize: 14 * 2.sp,
                                        validator: passwordValidator,
                                      ),
                                      const SizedBox(
                                        height: 47,
                                      ),
                                      CustomButton(
                                        buttonText: 'Sign Up',
                                        function: () async {
                                          // signUpKey.currentState.save();
                                          // setState(() => loading = true);

                                          // if (authController.isLoading ==
                                          //     true) {

                                          if (signUpKey.currentState
                                              .validate()) {
                                            await authController.signUp();
                                          }
                                        },
                                        textColor: black,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                CustomText(
                                  text: 'Or',
                                  color: white,
                                  fontSize: 28.sp,
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomCirleIcon(
                                        imgPath: "assets/apple.png",
                                        function: () {
                                          Fluttertoast.showToast(
                                            msg: "This does nothing",
                                          );
                                        }),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: CustomCirleIcon(
                                          imgPath: "assets/gmail.png",
                                          function: () {
                                            Fluttertoast.showToast(
                                              msg: "This does nothing",
                                            );
                                          }),
                                    ),
                                    CustomCirleIcon(
                                        imgPath: "assets/twitter.png",
                                        function: () {
                                          Fluttertoast.showToast(
                                            msg: "This does nothing",
                                          );
                                        }),
                                  ],
                                ),
                                const SizedBox(
                                  height: 36,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Already have an account?',
                                      color: white,
                                      fontSize: 16 * 2.sp,
                                    ),
                                    CustomTextButton(
                                      buttonText: "Login",
                                      function: () {
                                        Get.to(const UserSignIn());
                                      },
                                      textSize: 16 * 2.sp,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 36,
                                ),
                                CustomText(
                                  text: "By continuing, you agree to APP's",
                                  maxlines: 2,
                                  fontSize: 14 * 2.sp,
                                  color: white,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomTextButton(
                                        buttonText: "Terms & Conditions",
                                        textSize: 14 * 2.sp,
                                        textColor: green,
                                        function: () {
                                          Fluttertoast.showToast(
                                            msg: "This does nothing",
                                          );
                                        }),
                                    CustomText(
                                      text: " and ",
                                      maxlines: 2,
                                      fontSize: 14 * 2.sp,
                                      color: white,
                                    ),
                                    CustomTextButton(
                                        buttonText: "Privacy Policy",
                                        textSize: 14 * 2.sp,
                                        textColor: green,
                                        function: () {
                                          Fluttertoast.showToast(
                                            msg: "This does nothing",
                                          );
                                        }),
                                  ],
                                ),
                                const SizedBox(
                                  height: 66,
                                ),
                              ],
                            ),
                          ),
                        );
                }),
          ),
        ));
  }
}
