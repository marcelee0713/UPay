import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  String uid;
  String createdAt;
  String amount;
  String amountType;
  String type;
  String recipient;
  String? note;

  TransactionModel({
    required this.uid,
    required this.createdAt,
    required this.amount,
    required this.amountType,
    required this.type,
    required this.recipient,
    required this.note,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        uid: json["uid"],
        createdAt: json["createdAt"],
        amount: json["amount"],
        amountType: json["amountType"],
        type: json["type"],
        recipient: json["recipient"],
        note: json["note"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "createdAt": createdAt,
        "amount": amount,
        "amountType": amountType,
        "type": type,
        "recipient": recipient,
        "note": note,
      };

  factory TransactionModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return TransactionModel(
      uid: data['uid'],
      createdAt: data['createdAt'],
      amount: data['amount'],
      amountType: data['amountType'],
      type: data['type'],
      recipient: data['recipient'],
      note: data['note'] ?? '',
    );
  }
}
