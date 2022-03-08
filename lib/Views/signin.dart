import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Constants/helper_functions.dart';
import 'package:flutter_application_1/Controller/auth_controller.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/Views/Widgets/loader.dart';
import 'package:flutter_application_1/Views/signup.dart';
import 'package:flutter_application_1/Views/Widgets/button.dart';
import 'package:flutter_application_1/Views/Widgets/custom_circular_icon.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text_button.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text_Field.dart';
import 'package:flutter_application_1/Views/reset_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({Key key}) : super(key: key);

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  bool isLoading = false;

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
                            child: Form(
                              key: signInKey,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: "Sign In",
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 52.sp,
                                    customFont: GoogleFonts.sourceSansPro,
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
                                  const SizedBox(
                                    height: 53,
                                  ),
                                  CustomTextField(
                                    labelText: 'Email Address*',
                                    validator: emailValidator,
                                    controller: authController.emailController,
                                    textColor: white,
                                    fontSize: 14 * 2.sp,
                                  ),
                                  const SizedBox(
                                    height: 53,
                                  ),
                                  CustomTextField(
                                    labelText: 'Password*',
                                    validator: passwordValidator,
                                    controller:
                                        authController.passwordController,
                                    obsecureText: true,
                                    textColor: white,
                                    fontSize: 14 * 2.sp,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomTextButton(
                                          buttonText: 'Forget Password?',
                                          function: () {
                                            Get.to(() => ResetPassword());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 47,
                                  ),
                                  CustomButton(
                                    buttonText: 'Sign In',
                                    textColor: black,
                                    function: () async {
                                      if (signInKey.currentState.validate()) {
                                        await authController.signIn();
                                      }
                                    },
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                        text: 'Don\'t have an account?',
                                        color: white,
                                        fontSize: 16 * 2.sp,
                                      ),
                                      CustomTextButton(
                                        buttonText: "Sign Up",
                                        textSize: 18 * 2.sp,
                                        function: () {
                                          Get.to(const UserSignUp());
                                        },
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
                                        function: () {},
                                      ),
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
                                          function: () {}),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 66,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                }),
          ),
        ));
  }
}
