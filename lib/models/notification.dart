import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  String createdAt;
  String desc;
  String sender;

  NotificationModel({
    required this.createdAt,
    required this.desc,
    required this.sender,
  });

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return NotificationModel(
      createdAt: data['createdAt'] ?? '',
      desc: data['desc'] ?? '',
      sender: data['sender'] ?? '',
    );
  }

  factory NotificationModel.fromDataSnapshot(DataSnapshot snapshot) {
    Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

    // Ensure that the required fields are present in the snapshot
    if (!data.containsKey('createdAt') ||
        !data.containsKey('sender') ||
        !data.containsKey('desc')) {
      throw const FormatException('Invalid DataSnapshot format');
    }

    return NotificationModel(
      createdAt: data['createdAt'],
      sender: data['sender'],
      desc: data['desc'],
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        createdAt: json["createdAt"],
        desc: json["desc"],
        sender: json["sender"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "desc": desc,
        "sender": sender,
      };
}
