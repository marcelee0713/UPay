import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/notifications/notification_container.dart';
import 'package:flutter/material.dart';

class NotifModal {
  final String uid;

  NotifModal({required this.uid});

  build(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: const BoxDecoration(
                    color: ColorPalette.accentWhite,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 200,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Notifications",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ColorPalette.accentBlack,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "•••",
                              style: TextStyle(
                                color: ColorPalette.accentBlack,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(child: NotificationContainer(uid: uid))
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
