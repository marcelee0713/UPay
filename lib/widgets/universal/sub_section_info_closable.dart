import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class ClosableSubSectionInfo extends StatelessWidget {
  final IconData icon;
  final String leftHeadText;
  final String leftSubText;
  final VoidCallback onClose;
  const ClosableSubSectionInfo({
    super.key,
    required this.leftHeadText,
    required this.leftSubText,
    required this.onClose,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
              Icon(icon, size: 25, color: ColorPalette.skyBlue),
              const SizedBox(width: 10),
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
                      fontSize: 7.5,
                    ),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(
              Icons.close,
              size: 20,
              color: ColorPalette.accentWhite,
            ),
          )
        ],
      ),
    );
  }
}
