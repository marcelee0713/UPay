import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String studentNumber;
  String email;
  String mpin;
  String birthday;
  String phoneNumber;
  String balance;
  String salt;

  UserModel({
    required this.name,
    required this.studentNumber,
    required this.email,
    required this.mpin,
    required this.birthday,
    required this.phoneNumber,
    required this.balance,
    required this.salt,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      mpin: data['mpin'] ?? '',
      salt: data['salt'] ?? '',
      balance: data['balance'] ?? '',
      birthday: data['birthday'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      studentNumber: data['studentNumber'] ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        studentNumber: json["studentNumber"],
        email: json["email"],
        mpin: json["mpin"],
        birthday: json["birthday"],
        phoneNumber: json["phoneNumber"],
        balance: json["balance"],
        salt: json["salt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "studentNumber": studentNumber,
        "email": email,
        "mpin": mpin,
        "birthday": birthday,
        "phoneNumber": phoneNumber,
        "balance": balance,
        "salt": salt,
      };
}
