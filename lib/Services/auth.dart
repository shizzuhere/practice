// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Constants/helper_functions.dart';
import 'package:flutter_application_1/Controller/auth_controller.dart';
import 'package:flutter_application_1/Models/user_model.dart';
import 'package:flutter_application_1/Views/signin.dart';
import 'package:flutter_application_1/Views/signup.dart';
import 'package:get/get.dart';

import '../Views/welcome.dart';

class AuthService {
  /* -------------------------------------------------------------------------- */
  /*                                 Create User                                */
  /* -------------------------------------------------------------------------- */
  Future<UserCredential> createUser(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  /* -------------------------------------------------------------------------- */
  /*                             Create Collecction                             */
  /* -------------------------------------------------------------------------- */
  Future createCollection(UserModel userModel) {
    return FirebaseFirestore.instance.collection("user").add(userModel.toMap());
    // return FirebaseFirestore.instance.collection("user").doc(currentUser.uid).set(userModel.toMap());
  }

  /* -------------------------------------------------------------------------- */
  /*                                   SignIn                                   */
  /* -------------------------------------------------------------------------- */
  Future loginUser({String email, String password}) async {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  /* -------------------------------------------------------------------------- */
  /*                               Reset Password                               */
  /* -------------------------------------------------------------------------- */
  Future resetPassword(String resetPassword) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: resetPassword);
  }
}
