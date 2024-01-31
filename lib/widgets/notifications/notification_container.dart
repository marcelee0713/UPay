import 'package:citefest/models/notification.dart';
import 'package:citefest/widgets/notifications/notification_box.dart';
import 'package:citefest/widgets/notifications/notification_empty.dart';
import 'package:citefest/widgets/notifications/notification_error.dart';
import 'package:citefest/widgets/notifications/notification_loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NotificationContainer extends StatefulWidget {
  final String uid;
  const NotificationContainer({super.key, required this.uid});

  @override
  State<NotificationContainer> createState() => _NotificationContainerState();
}

class _NotificationContainerState extends State<NotificationContainer> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference db =
        FirebaseDatabase.instance.ref().child("notifications/${widget.uid}");

    return StreamBuilder(
      stream: db.onValue,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const NotificationLoading();
        }

        if (snapshot.hasError) {
          return const NotificationError();
        }

        List<NotificationModel> list = [];

        if (snapshot.data!.snapshot.exists) {
          for (var val in snapshot.data!.snapshot.children) {
            NotificationModel obj = NotificationModel.fromDataSnapshot(val);
            list.add(obj);
          }
        }

        if (list.isEmpty) {
          return const NotificationEmpty();
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return NotificationBox(
              date: list[index].createdAt,
              sender: list[index].sender,
              desc: list[index].desc,
            );
          },
        );
      },
    );
  }
}
