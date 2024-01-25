import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class SubSectionInfo extends StatelessWidget {
  final String iconPath;
  final String leftHeadText;
  final String leftSubText;
  final String rightHeadText;
  final String rightSubText;
  const SubSectionInfo(
      {super.key,
      required this.iconPath,
      required this.leftHeadText,
      required this.leftSubText,
      required this.rightHeadText,
      required this.rightSubText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        color: ColorPalette.darkBlue,
        borderRadius: BorderRadius.circular(12),
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                height: 30,
                width: 30,
                color: ColorPalette.skyBlue,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    leftHeadText,
                    style: const TextStyle(
                      color: ColorPalette.accentWhite,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    leftSubText,
                    style: const TextStyle(
                      color: ColorPalette.accentWhite,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 9,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                rightHeadText,
                style: const TextStyle(
                  color: ColorPalette.accentWhite,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2.5),
              Text(
                rightSubText,
                style: const TextStyle(
                  color: Color(0xff2EDCA1),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w300,
                  fontSize: 8,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
