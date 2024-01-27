import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class ActivityBox extends StatelessWidget {
  final String name;
  final String filePath;
  final VoidCallback onTap;
  final double iconSize;
  const ActivityBox(
      {super.key,
      required this.name,
      required this.filePath,
      required this.onTap,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  filePath,
                  height: iconSize,
                  width: 25,
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
            color: Color(0xff585858),
          ),
        ],
      ),
    );
  }
}
