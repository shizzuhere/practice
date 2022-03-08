import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/colors.dart';
import 'package:flutter_application_1/Models/user_model.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/Views/Welcome.dart';
import 'package:flutter_application_1/Views/Widgets/loader.dart';
import 'package:flutter_application_1/Views/signin.dart';
import 'package:flutter_application_1/Views/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  bool isLoading = false;

  AuthService authService = AuthService();
  // String firebaseUser;
  UserModel userModel = UserModel();

  /* -------------------------------------------------------------------------- */
  /*                                   Sign In                                  */
  /* -------------------------------------------------------------------------- */
  signIn() async {
    isLoading = true;
    update();
    try {
      await authService.loginUser(
        email: emailController.text,
        password: passwordController.text,
      );
      getUserData(email: emailController.text);
      Get.to(() => const WelcomeScreen());
      update();
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        Get.snackbar('Error', e.message);
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                              Sign Up                                       */
  /* -------------------------------------------------------------------------- */

  signUp() async {
    isLoading = true;
    update();
    try {
      userModel = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
      );
      await authService.createUser(
        emailController.text,
        passwordController.text,
      );
      await authService.createCollection(userModel);

      getUserData(email: emailController.text);
      // update();
      // Get.back();
      isLoading = false;
      update();

      Get.to(() => const WelcomeScreen());
    } catch (e) {
      if (e is FirebaseAuthException) {
        Get.snackbar('Error', e.message);
      }
      Get.back();
    } finally {
      isLoading = false;
      update();
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                                 getUserData                                */
  /* -------------------------------------------------------------------------- */

  getUserData({
    @required String email,
  }) async {
    if (FirebaseAuth.instance.currentUser != null) {
      var userData = await FirebaseFirestore.instance
          .collection('user')
          .where("email", isEqualTo: email)
          .get();
      if (userData.docs.length > 0) {
        userModel = UserModel.fromDocumentSnapshot(userData.docs[0]);
        update();
      }
    }
  }

/* -------------------------------------------------------------------------- */
/*                               Reset Password                               */
/* -------------------------------------------------------------------------- */

  resetPassword() {
    try {
      authService.resetPassword(resetPasswordController.text).then((value) {
        Get.snackbar('Email Sent', 'Check your Email', backgroundColor: white);
      }).onError((error, stackTrace) {
        Get.snackbar('Error', 'Invalid email', backgroundColor: white);
      });
      Get.to(() => const UserSignIn());
    } catch (e) {
      // Get.snackbar('Error', e.message);
    }
  }

/* -------------------------------------------------------------------------- */
/*                                   SIGNOUT                                  */
/* -------------------------------------------------------------------------- */
  signout() async {
    await FirebaseAuth.instance.signOut();
    clearController();
    Get.off(() => const UserSignUp());
  }

  clearController() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
