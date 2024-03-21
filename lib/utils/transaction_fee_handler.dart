import 'package:citefest/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> transactionFeeHandler({required String uid}) async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    UserModel user = UserModel.fromSnapshot(doc);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM dd').format(now);

    if (formattedDate != user.lastTransactionDate) {
      await transactionCountReset(uid: uid, userData: user, now: formattedDate);
    }
  } catch (err) {
    if (err is FirebaseException) {
      throw "Error: ${err.message}";
    }

    throw "Error: ${err.toString()}";
  }
}

Future<void> transactionCountReset({
  required String uid,
  required UserModel userData,
  required String now,
}) async {
  try {
    UserModel user = userData;
    user.transactionCount = "0";

    await FirebaseFirestore.instance.collection("users").doc(uid).set(
          user.toJson(),
        );
  } catch (err) {
    if (err is FirebaseException) {
      throw "Error: ${err.message}";
    }

    throw "Error: ${err.toString()}";
  }
}

Future<void> updateTransactionDate(
    {required UserModel userData, required String uid}) async {
  try {
    UserModel user = userData;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM dd').format(now);

    user.lastTransactionDate = formattedDate;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(user.toJson());
  } catch (err) {
    if (err is FirebaseException) {
      throw "Error: ${err.message}";
    }

    throw "Error: ${err.toString()}";
  }
}

Future<void> updateTransactionCount({
  required UserModel userData,
  required String uid,
}) async {
  try {
    UserModel user = userData;

    int count = int.parse(user.transactionCount);
    debugPrint(count.toString());
    if (count < 6) {
      user.transactionCount = (count + 1).toString();
      debugPrint(user.transactionCount);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(user.toJson());
    }
  } catch (err) {
    if (err is FirebaseException) {
      throw "Error: ${err.message}";
    }

    throw "Error: ${err.toString()}";
  }
}

Future<String> fetchTransactionFee({required String uid}) async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    UserModel user = UserModel.fromSnapshot(doc);

    String transactionFee =
        transactionCountConversion(count: user.transactionCount);

    return transactionFee;
  } catch (err) {
    return "0";
  }
}

String transactionCountConversion({required String count}) {
  String fee = (5 * int.parse(count)).toString();
  return fee;
}
