import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  final String date;
  final String sender;
  final String desc;
  const NotificationBox(
      {super.key,
      required this.date,
      required this.sender,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: date,
      preferBelow: false,
      textStyle: const TextStyle(
        color: ColorPalette.accentWhite,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
      triggerMode: TooltipTriggerMode.tap,
      decoration: BoxDecoration(
        color: ColorPalette.skyBlue,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      ),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 175, 191, 240),
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icons/person1.png",
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sender,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
