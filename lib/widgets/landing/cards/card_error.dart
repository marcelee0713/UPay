import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final String error;
  const ErrorCard({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorPalette.skyBlue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Error",
            style: TextStyle(
              color: ColorPalette.accentWhite,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            error,
            style: const TextStyle(
              color: ColorPalette.accentWhite,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
