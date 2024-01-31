import 'dart:async';

import 'package:citefest/models/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class NotificationsRes {
  List<NotificationModel> list;
  String? errorMessage;

  NotificationsRes({required this.list, this.errorMessage});
}

Future<List<NotificationModel>> apiGetNotifications(
    {required String uid}) async {
  DatabaseReference db =
      FirebaseDatabase.instance.ref().child("notifications/$uid");
  try {
    List<NotificationModel> list = [];
    Completer<StreamController<List<NotificationModel>>> completer =
        Completer();

    db.onValue.listen((event) {
      if (event.snapshot.value != null) {
        debugPrint(event.snapshot.value.toString());
      }
    });

    return list;
  } catch (err) {
    if (err is FirebaseException) {
      throw err.message.toString();
    }

    throw err.toString();
  }
}
