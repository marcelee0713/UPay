import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileDetailsBox extends StatelessWidget {
  final String name;
  final String balance;
  const ProfileDetailsBox(
      {super.key, required this.name, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
        gradient: const LinearGradient(
          colors: [
            Color(0xff6282E4),
            Color(0xff6F99E6),
            Color(0xff7DB2E9),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/user.png",
            height: 90,
            width: 90,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Name",
                    style: TextStyle(
                      color: ColorPalette.accentWhite,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      color: ColorPalette.accentWhite,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Balance",
                    style: TextStyle(
                      color: ColorPalette.accentWhite,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    balance,
                    style: const TextStyle(
                      color: ColorPalette.accentWhite,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
