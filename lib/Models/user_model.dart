import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.firstName,
    this.lastName,
    this.email,
  });

  String firstName;
  String lastName;
  String email;

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) => UserModel(
        firstName: doc["firstName"],
        lastName: doc["lastName"],
        email: doc["email"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };
}
