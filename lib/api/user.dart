import 'package:citefest/models/profile_card.dart';
import 'package:citefest/models/student_card.dart';
import 'package:citefest/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<StudentCardRes> apiStudentCard({required String uid}) async {
  try {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!documentSnapshot.exists) {
      throw Exception("User data does not exist!");
    }

    UserModel obj = UserModel.fromSnapshot(documentSnapshot);
    StudentCardModel data = StudentCardModel(
        studentNumber: obj.studentNumber, balance: obj.balance);
    StudentCardRes res = StudentCardRes(studentCardRes: data);

    return res;
  } catch (err) {
    if (err is FirebaseException) {
      return StudentCardRes(errorMessage: err.message);
    }

    return StudentCardRes(errorMessage: err.toString());
  }
}

Future<ProfileCardRes> apiProfileCard({required String uid}) async {
  try {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!documentSnapshot.exists) {
      throw Exception("User data does not exist!");
    }

    UserModel obj = UserModel.fromSnapshot(documentSnapshot);
    ProfileCardModel data =
        ProfileCardModel(name: obj.name, balance: obj.balance);
    ProfileCardRes res = ProfileCardRes(data: data);

    debugPrint(obj.name);

    return res;
  } catch (err) {
    if (err is FirebaseException) {
      return ProfileCardRes(errorMessage: err.message);
    }

    return ProfileCardRes(errorMessage: err.toString());
  }
}
