import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class EmptyAnalytics extends StatelessWidget {
  const EmptyAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.analytics_rounded,
          color: ColorPalette.accentBlack,
          size: 200,
        ),
        Text(
          "Empty!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "You don't have enough data yet...",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
