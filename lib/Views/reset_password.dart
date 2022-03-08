import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Constants/helper_functions.dart';
import 'package:flutter_application_1/Controller/auth_controller.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/Views/Widgets/button.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text.dart';
import 'package:flutter_application_1/Views/Widgets/custom_text_Field.dart';
import 'package:flutter_application_1/Views/Widgets/loader.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ResetPassword extends StatelessWidget {
  GlobalKey<FormState> resetKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundOne,
      body: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (authController) {
            return SafeArea(
              child: Form(
                key: resetKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Reset Password",
                      color: green,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomTextField(
                        validator: emailValidator,
                        labelText: 'Enter a Valid E-mail*',
                        fontSize: 24,
                        controller: authController.resetPasswordController,
                      ),
                    ),
                    CustomButton(
                        buttonText: 'Continue',
                        textColor: black,
                        function: () {
                          if (resetKey.currentState.validate()) {
                            authController.resetPassword();
                          }
                        }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
