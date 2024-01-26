import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthInfo extends StatelessWidget {
  final String headText;
  final String subText;
  const AuthInfo({super.key, required this.headText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          headText,
          style: const TextStyle(
            color: ColorPalette.accentBlack,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        Text(
          subText,
          style: const TextStyle(
            color: ColorPalette.accentBlack,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
