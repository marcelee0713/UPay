import 'dart:ffi';

import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class LandingButton extends StatelessWidget {
  final String buttonName;
  final String filePath;
  final VoidCallback onTap;
  const LandingButton(
      {super.key,
      required this.buttonName,
      required this.filePath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
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
                4,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              filePath,
              height: 25,
              width: 25,
              color: ColorPalette.primary,
            ),
            const SizedBox(width: 3),
            Text(
              buttonName,
              style: const TextStyle(
                color: ColorPalette.accentBlack,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
