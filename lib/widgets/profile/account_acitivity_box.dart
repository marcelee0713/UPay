import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class ActivityBox extends StatelessWidget {
  final String name;
  final String filePath;
  final VoidCallback onTap;
  const ActivityBox(
      {super.key,
      required this.name,
      required this.filePath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  filePath,
                  height: 30,
                  width: 30,
                  color: ColorPalette.skyBlue,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: ColorPalette.accentBlack,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 25,
          ),
        ],
      ),
    );
  }
}
