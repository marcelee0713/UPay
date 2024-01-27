import 'dart:ffi';

import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class LandingButton extends StatelessWidget {
  final String buttonName;
  final String filePath;
  final VoidCallback onTap;
  final double iconHeight;
  final double iconWidth;
  const LandingButton(
      {super.key,
      required this.buttonName,
      required this.filePath,
      required this.onTap,
      required this.iconHeight,
      required this.iconWidth});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        decoration: BoxDecoration(
          color: ColorPalette.accentWhite,
          borderRadius: BorderRadius.circular(8),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              filePath,
              height: iconHeight,
              width: iconWidth,
              color: ColorPalette.primary,
            ),
            const SizedBox(width: 3),
            Text(
              buttonName,
              style: const TextStyle(
                color: ColorPalette.accentBlack,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
